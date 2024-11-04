local servers = {
	"lua_ls",
	"cssls",
	"html",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
}


local settings = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Failed lspconfig")
	return
end

require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function (server_name) -- default handler
		local opts = {}
		local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server_name)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end
		lspconfig[server_name].setup(opts)
	end,
}



