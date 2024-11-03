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

	-- TODO take a look at these
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F6>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

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
