local lsp_zero = require('lsp-zero')

return {
	on_init = function(client)
		lsp_zero.nvim_lua_settings(client, {})
	end
}
