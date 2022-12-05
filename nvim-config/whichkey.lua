local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	print("Couldn't load: which-key")
	return
end

-- wk.register({
-- 	r = {
-- 		name = "Refactor",
-- 		e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
-- 		v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
-- 		i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
-- 	}
-- }, { prefix = "<leader>" , mode = "v"})




