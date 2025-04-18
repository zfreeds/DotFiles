local lsp_zero = require('lsp-zero')
local illuminate = require('illuminate')
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("lspconfig failed")
  return
end

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf, noremap = true, silent = true }

		-- todo look into lsp_finder  -- all lsp locations combined
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', add(opts, {desc = "Hover"}))
    vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<cr>', add(opts, {desc = "Definition"}))
    vim.keymap.set('n', 'gD', '<cmd>FzfLua lsp_declarations<cr>', add(opts, {desc = "Declaration"}))
    vim.keymap.set('n', 'gi', '<cmd>FzfLua lsp_implementations<cr>', add(opts, {desc = "Implemenation"}))
    vim.keymap.set('n', 'go', '<cmd>FzfLua lsp_definitions<cr>', add(opts, {desc = "Type definition"}))
    vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<cr>', add(opts, {desc = "References/Usages"}))
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', add(opts, {desc = "Signature Help"}))

	vim.keymap.set('n', 'ge', function()vim.diagnostic.goto_next({buffer=0}) end, add(opts, {desc = "Next Error"}))
	vim.keymap.set('n', 'gE', function()vim.diagnostic.goto_prev({buffer=0}) end, add(opts, {desc = "Prev Error"}))
	-- Show error
	vim.keymap.set('n', 'gl', function()vim.diagnostic.open_float() end, opts)
		-- todo gp for go to parent
-- Refactoring	
    vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.code_action()<cr>', add(opts, {desc = "Code actions"}))
    vim.keymap.set({'n', 'v'}, '<leader>rf', vim.lsp.buf.format, add(opts, { desc = "Format"}))
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', add(opts, {desc = "Rename"}))
-- todo <leader>rf -- rename file

	local refactor_lib = require('refactoring')
	refactor_lib.setup()
	vim.keymap.set({'n', 'v'}, '<leader>rm', function() refactor_lib.refactor('Extract Function') end, add(opts, {desc = "Extract Function"}))
	vim.keymap.set({'n', 'v'}, '<leader>rv', function() refactor_lib.refactor('Extract Variable') end, add(opts, {desc = "Extract Variable"}))
	vim.keymap.set('n', '<leader>ri', function() refactor_lib.refactor('Inline Variable') end, add(opts, {desc = "Inline Variable"}))
	vim.keymap.set('n', '<leader>rI', function() refactor_lib.refactor('Inline Function') end, add(opts, {desc = "Inline Variable"}))

	-- Add term highlighting
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client ~= nil then
		illuminate.on_attach(client)
    end
  end,
})

require "user.lsp.mason"
require "user.lsp.cmp"


function add(opts, other)
	return vim.tbl_deep_extend("force", opts, other)
end


vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	float = {
		source = true,
	},
})


vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		-- underline = not vt,
		-- signs = not vt,
	}
end, { desc = "toggle diagnostic" })

