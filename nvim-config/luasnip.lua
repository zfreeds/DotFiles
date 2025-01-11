-- View ./cmp.lua for other luasnip integrations
--
local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	print("Could not load luasnip")
	return
end

