-- View ./cmp.lua for other luasnip integrations
--
local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	print("Could not load luasnip")
	return
end

local list_snips = function()
	local ft_list = require("luasnip").available()[vim.o.filetype]
	print(vim.inspect(ft_list))
end

vim.api.nvim_create_user_command('ListSnips', list_snips, {})

