local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	print("Couldn't load: bufferline")
	return
end

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", --  TODO toggle tab pinning
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    indicator = { style = "icon", icon = "▎"},
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 60,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 25,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "nerdtree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  },
}
