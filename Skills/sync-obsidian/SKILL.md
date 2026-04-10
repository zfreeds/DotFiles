# Daily Context Sync

> Comprehensive daily workflow to gather context from Vault and Slack into Zack's Obsidian vault.

## Trigger Phrases
- `/sync`
- "sync my context"

## Overview

This skill runs a 6-phase workflow to gather context from all integrated systems and write AI-generated summaries to the `AI/` subfolder of the Obsidian vault at `/Users/zackfreedman/obsidian/shopify/`.

**Critical safety rule**: AI ONLY reads from and writes to the `AI/` subfolder. Never read, modify, overwrite, or append to files outside `AI/`. The user's notes are off-limits unless they explicitly share content or ask you to read a specific file.

## Workflow Phases

### Phase 1: Gather Latest Context

**Objective**: Pull fresh data from all connected systems.

**Actions**:

0. **Determine lookback point** (before any Slack fetches)
   - Glob for the most recent sync note using pattern `**/Sync-*.md` with path `/Users/zackfreedman/obsidian/shopify/AI` and read its `last_synced` frontmatter value (note: `Daily/Sync-*.md` without `**/` won't match — Glob requires `**` to recurse into subdirectories)
   - Convert that datetime to a Slack timestamp: run `date -d 'YYYY-MM-DDTHH:MM' '+%s'` in Bash and append `.000000`
   - Use that as `oldest` for ALL channel fetches below
   - If no previous sync note exists or `last_synced` is missing, fall back to start of today: `date -d 'YYYY-MM-DD' '+%s'` (using today's date) + `.000000`

1. **Slack** (slack-mcp)
   - Check unreads: `mcp__slack-mcp__get_unreads` (useful for discovering which channels have activity and spotting unread threads, but do NOT use its `oldest` values for channel fetches — they reflect the last-read position and will miss messages if the user already caught up)
   - Check core channels for important threads (see Channel List below)
   - Check recent DMs for action items
   - Note: use `limit` (not `count`) for `get_messages` channel/search actions
   - **Slack timestamps**: The `oldest` parameter for `get_messages` MUST use Slack's format: `1234567890.123456` (10 digits, dot, 6 digits). Never pass bare Unix timestamps like `1234567890`.

2. **Vault** (vault-mcp)
   - Fetch active project updates:
     - Managed Markets: Managed International Pricing (#gsd:47202)
   - Check for new reviews, milestones, blockers
   - If you discover Zack is contributing to a project not listed above, suggest updating this skill to include it

3. **Recognition & Incidents**
   - **Unicorns** (vault-mcp): Search `vault_search_all` with query `"unicorn Zack Freedman"` to find unicorn recognition posts. These are important self-review material — capture who gave it, why, and link to the Vault post.
   - **Incidents** (slack-mcp): Search for incident channels Zack participated in: `action: "search"` with `query: "from:@Zack Freedman in:#inc-"`. Incident response (especially off-hours) is high-value win material — capture what happened, what Zack did, and the outcome.

4. **Google Workspace** (gworkspace-mcp)
   - **Calendar**: Fetch events since the lookback point using `calendar_events` with `time_min` set to the lookback datetime and `include_attachments: true`. Capture meetings attended, 1:1s, planning sessions — these provide context for what Zack was working on and decisions made.
   - **Meeting transcripts**: For events that have attached Google Docs (commonly auto-generated transcripts from Google Meet), read the doc using `read_file` with the attachment's file ID. Summarize key discussion points, decisions, and action items from the transcript.
   - **Google Docs** (tracked documents): Read content and comments from actively-tracked docs (see Tracked Documents below). New comments and content changes since last sync are valuable context — capture decisions, open questions, and action items. Use `read_file` with the file ID.
   - **Google Drive** (recent activity): Optionally search Drive with `search_drive` for recently modified files Zack owns or was shared on, to catch new docs or decks relevant to active projects.

   **Rules for Google Workspace data**:
   - Calendar events go in the sync note for the day they occurred
   - For meeting transcripts, summarize at medium detail: key decisions, action items, and topics discussed — not a full transcript dump. Attribute statements to `[[Full Name]]` when the speaker is identifiable.
   - Include Google Doc comments with author attribution as `[[Full Name]]`
   - Link to Google Docs using their URL: `https://docs.google.com/document/d/{file_id}`
   - If a meeting has a linked doc/slides attachment, note it and read if relevant
   - Skip recurring standup/ceremony meetings unless something noteworthy happened (use Slack context or transcript content to judge)

### Phase 2: Create/Update Sync Notes

**Objective**: Create or update sync notes in `AI/Daily/`. One note per day is created for each day since the last sync. For example, if `last_synced` was Tuesday evening and it's now Friday, create notes for Wednesday, Thursday, and Friday — each containing only that day's Slack messages and activity.

**How to assign content to days**: Use the Slack message timestamps to determine which day each message belongs to. Vault activity and GitHub notifications should be assigned to the day they occurred. **Never create notes for weekends or holidays** — always fold the data into the following workday.

**Template Structure** (one per day):
```markdown
---
tags: [daily, ai-sync]
date: YYYY-MM-DD
daily_note: "[[YYYY-MM-DD-ddd]]"
last_synced: "YYYY-MM-DDTHH:MM"
---

# YYYY-MM-DD

Daily note: [[YYYY-MM-DD-ddd]]

## 🎯 Suggested Focus
<!-- 3-5 priorities based on slack and project state -->
1.
2.
3.

## 💬 Key Discussions
<!-- Important Slack threads, decisions, blockers -->

## 🏆 Wins
<!-- Self-review material: shipped features, merged PRs, unblocked teammates, caught bugs,
     incident response (esp. off-hours), recognition received (unicorns, shoutouts),
     good architectural calls, mentoring, tooling/dashboards built -->

## 📋 Project Updates
<!-- Status changes, new PRs, milestones from Vault -->

```

**Rules**:
- Always link back to the user's daily note via `[[YYYY-MM-DD-ddd]]` (e.g. `[[2026-02-11-Wed]]`) for backlinks. **CRITICAL**: Do NOT guess the day-of-week abbreviation — run `date -d 'YYYY-MM-DD' '+%a'` in Bash to compute it correctly. (Uses GNU date syntax since the Bash sandbox is Linux.)
- If a sync note already exists for a given day, UPDATE it (append new activity) rather than overwriting
- **ALWAYS link Slack messages** using `https://shopify.slack.com/archives/{channel_id}/p{timestamp_without_dot}` (e.g. ts `1770823611.738429` → `https://shopify.slack.com/archives/C02HQRVNUHL/p1770823611738429`). Every discussion bullet that references a specific Slack message MUST include a link. Channel IDs come from `get_unreads` or the message data itself.
- Do NOT create an "Action Items" section (dashboard queries handle aggregation)
- Write to `AI/Daily/` only, never to `Journal/Daily/`
- **After writing or updating any sync note**, set its `last_synced` frontmatter to the current time (e.g. `"2026-02-20T12:30"`). The next sync determines its lookback point by reading `last_synced` from the most recent `Sync-*.md`.
- **Only today's note gets the `🎯 Suggested Focus` section.** Backfilled past-day notes should omit it — stale priorities aren't useful.
- **Suggested Focus must be genuinely pending.** Never include items Zack has already completed (reviewed a PR, responded to a thread, shipped a fix). Check Zack's messages and DMs for evidence of completion before including any action-oriented suggestion. If someone asked for a review and Zack's messages show he already engaged with it, skip it.

### Phase 3: Retroactive Context Updates

**Objective**: Update existing sync notes (up to 7 days back) with cross-day context that wasn't available when they were written. Phase 2 already handles backfilling missed days — Phase 3 is specifically for adding follow-up context to notes that already exist.

**Examples of retroactive updates**:
- A PR mentioned in Monday's note was merged on Wednesday → append to Monday's note
- A decision from Tuesday was reversed on Thursday → note the reversal on Tuesday's entry
- A blocker from last week was resolved → mark it resolved in that day's note

**Actions**:
- Review decisions that emerged after sync notes were written
- Update completed actions (mark done in AI sync notes only)
- Add context that became clear retroactively
- Add links to relevant notes or project updates created later

### Phase 4: Update AI Dashboards

**Objective**: Keep AI-maintained reference docs current in `AI/`.

**Dashboards to Update** (create in `AI/` if they don't exist yet):
- `AI/Decisions Log.md` - Decisions that directly affect Zack's work or require his action (append only, never rewrite old entries). Skip decisions he's not involved in or affected by.
- `AI/Project Index.md` - Project status changes from Vault

**Rules**:
- Only write to files in `AI/`
- Reference PRs by URL when available, number otherwise
- Wiki-link to user notes where relevant (e.g. `[[Adaptive Pricing]]`) for discoverability

### Phase 5: Generate Insights

**Objective**: Surface patterns and priorities.

**Output**:
- Identify blockers across projects
- Flag items needing attention (overdue, stale, waiting)
- Suggest priorities based on project deadlines and Slack context
- Note any anomalies or items needing clarification

**Stale action item filtering**: Before suggesting "review X PR" or "respond to Y thread" in Suggested Focus or Attention Needed, check whether Zack has already acted on it. Evidence of completion includes:
- Zack posted a message in the thread after the request
- The PR shows Zack as a reviewer in Slack context (e.g., someone thanking him, or his comments appearing)
- Zack's DMs or messages reference the item as done
- For PR reviews: check GitHub (`gh pr view <number> --json reviews`) to see if Zack already reviewed it

If Zack has already acted, do NOT surface it as a todo. Only include genuinely pending items where there's no evidence of completion.

### Phase 6: Validate Wiki-Links and Zettelkasten Linking

**Objective**: Build a rich backlink graph by wiki-linking people, existing user notes, and recurring concepts throughout all sync output.

**Before writing notes**: Read the user's note titles at `/Users/zackfreedman/obsidian/shopify/*.md` (just `ls`, don't read contents) to know what linkable notes exist. This is a READ-ONLY step — never modify the user's notes.

**People References**:
- Always use full names in `[[wiki-links]]` (broken links are fine — Obsidian still tracks them)
- Partial names (e.g., "Cam") should resolve to full name `[[Cameron Bothner]]` based on context
- If AI needs to write notes about a person, use `AI/People/Generated-Full-Name.md`
- Do NOT wiki-link names in Slack usernames or email addresses

**Link to existing user notes aggressively**: When a sync note discusses a topic that matches an existing note in the vault, wiki-link it. Examples:
- Discussing tariff misclassification → `[[Section 232]]`
- ATC rotation → `[[ATC]]`
- Carrier service work → `[[Markets Pro App Carrier Service]]` or `[[Adaptive Shipping]]`
- Breakdown calculator → `[[Adaptive Pricing]]`
- Global-e billing → `[[Global-E]]`
- Flag cleanup → `[[Feature Flags]]`
- Coefficient work → `[[Adaptive Pricing]]`
- Sellability → `[[Fast Sellability]]`
- Tax-related → `[[Duties and Taxes]]`, `[[Active Tax]]`, etc.
- Incident response → `[[Incident]]`

**Wiki-link recurring concepts** even if no backing file exists yet: Obsidian's backlink graph will show every sync note that mentioned the topic, making it searchable and traceable over time. The test: "Would someone reasonably search for this topic or want to see when it came up across multiple syncs?" If yes, link it.

Good recurring concept links: `[[Transaction Breakdowns]]`, `[[Shipping Label Costs]]`, `[[Default-on Experiment]]`, `[[Coefficient]]`, `[[Resiliency Backlog]]`, `[[Onboarding]]`, `[[Country Expansion]]`

Do NOT link one-off incidents or throwaway details (e.g., "DHL RTS duties for one merchant", "Cassidy's pet grooming tariff question"). These don't accumulate useful backlinks.

**Avoiding duplicate note names**: Obsidian doesn't allow duplicate filenames across the vault. Before creating any new file in `AI/`, check the user's existing note names (`ls /Users/zackfreedman/obsidian/shopify/*.md`). If a note with that name already exists in the user's personal notes, prepend `AI - ` to avoid naming conflicts (e.g. `AI - Adaptive Pricing.md`).

**Rules**:
- Link liberally — broken links (no backing file) are fine and expected
- Don't create new note files for every concept; the wiki-link alone provides value
- Only create a new `AI/` note file if you have substantial standalone content for it
- First occurrence of each link in a section is enough; don't over-link the same term

## Channel List

Channel IDs are needed for constructing Slack links. Always record the channel ID when fetching unreads.

### Project Channels
- `#managed-international-pricing` (C093Z8YKD0W)
- `#proj-m1-new-shipping-option` (C08GZEGL8RW) — New delivery settings M1 rollout. Only track items that interact with adaptive shipping (carrier service registration, rate display, handling fees). Skip shopibot flag assignments and unrelated M1 bugs.

### Team Channels
- `#cross-border-shipping-dev` (CQ7Q4L0BE)
- `#cross-border-shipping-talk` (C02HQRVNUHL)
- `#duties-cross-border-shipping-rnd` (C01JLB1SCA3) — **Skip routine support issues** (TMSP tickets, merchant-specific bugs, tax config questions). Only include items that require Zack's action, represent a systemic problem, or affects his projects.

### Partner & Stakeholder Channels
- `#avalara-lair` (C81F9MWP4) — Avalara partnership discussions, outage coordination, tax calculation issues
- `#payments-cross-border-talk` (C074FQ8MCTA) — Cross-border payments discussions, often where recognition and strategic context surfaces

### Other
- `#ruby-and-rails-talk` (C04K0UR8PNK)

If you notice Zack is active in work-related channels not listed here, suggest updating this skill to include them. Do NOT suggest interest/social channels (e.g. #ai-centaurs, #hackdays, #random). Only suggest channels with ongoing project or team discussions.

## Output Summary

After completing all phases, provide:

```markdown
## Sync Complete - {Date}

### Updates Made
- **Daily Notes**: {count} updated
- **Project Notes**: {list}
- **Dashboards**: {list}
- **Wiki-Links Fixed**: {count}

### Today's Priorities
1. {priority 1}
2. {priority 2}
3. {priority 3}

### Attention Needed
- {blockers, overdue items, anomalies}

```

## Constraints

- **Medium detail level**: Strategic context, not every message
- **AI folder only**: All reads and writes stay in `AI/` unless explicitly told otherwise
- **Vault path**: `/Users/zackfreedman/obsidian/shopify/`
- **Glob/Search base path**: Always use `/Users/zackfreedman/obsidian/shopify/AI` (not the parent `shopify/` dir) as the `path` parameter for Glob calls. This matches the auto-allowed `Search(.../AI/**)` permission rule and avoids unnecessary permission prompts.
- **Fetch real data**: Always pull from Vault/Slack, never assume
- **Action items in source notes only**: Use Obsidian Tasks syntax `- [ ] Task 📅 YYYY-MM-DD #todo`
- **Never duplicate actions**: Create once, mark done once
- **Markdown tables**: Always leave a blank line before table header rows (Obsidian won't render them otherwise)
- **Slack links are mandatory**: Every Slack message or thread referenced in notes MUST have a clickable link. Construct from channel ID + timestamp. No exceptions.
- **Channel context matters for attribution**: Messages in general channels (e.g. #ruby-and-rails-talk) are addressed to whoever's reading — pronouns like "your team" do NOT mean Zack's team. Only attribute things to cross-border/managed-markets if the message is in a team-specific channel OR explicitly names the team.