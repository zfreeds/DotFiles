local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	print("Couldn't load: obsidian")
	return
end
obsidian.setup({
	dir = "~/obsidian",
	completion = {
		nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
	},
	daily_notes = {
		folder = "diary/Daily",
	},

})

vim.keymap.set(
  "n",
  "gf",
  function()
    if obsidian.util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)
