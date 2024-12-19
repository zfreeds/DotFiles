-- View ./cmp.lua for other luasnip integrations
--
local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	print("Could not load luasnip")
	return
end

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local oneDay = (60 * 60 * 24)
local currentTime = os.time() -- Get current time in seconds
local yesterdayTime = currentTime - oneDay
local tomorrowTime = currentTime + oneDay

function getDate(time)
	return os.date('%Y-%m-%d', time)
end

-- fixme this probably runs date logic on start instead of when template is called
-- ls.add_snippets(nil, {
-- 	all = {
-- 		snip({
-- 			trig = "dailyNote",
-- 			dscr = "Template for a daily note",
-- 			}, {
-- 				text({
-- 					"---",
-- 					"Locations: Ottawa",
-- 					"Tags: ",
-- 					"File Creation Date: " .. getDate(currentTime),
-- 					"---",
-- 					"<<  [[" .. getDate(yesterdayTime) .."]] - [[" .. getDate(currentTime) .. "|Here]] - [[" .. getDate(tomorrowTime) .. "]] >>",
-- 					"",
-- 					"## What happened today?",
-- 				})
-- 		}),
-- 	},
-- })
