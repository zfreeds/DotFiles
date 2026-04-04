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


for _, server_name in ipairs(servers) do
	local opts = {}
	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server_name)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	vim.lsp.config(server_name, opts)
	vim.lsp.enable(server_name)
end



