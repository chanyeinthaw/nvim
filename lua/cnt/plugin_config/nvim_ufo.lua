function _G.fold_text()
	local lines = vim.v.foldend - vim.v.foldstart - 1
	return vim.fn.getline(vim.v.foldstart)
		.. " .. "
		.. lines
		.. " lines .. "
		.. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
end

vim.opt.foldenable = true
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.fold_text()"
-- vim.opt.fillchars:append({
-- 	fold = " ",
-- })
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"

vim.keymap.set("n", "zK", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()

	if not winid then
		vim.lsp.buf.hover()
	end
end, {
	desc = "Peek Fold",
})

vim.keymap.set("n", "zM", require("ufo").closeAllFolds, {
	desc = "Close all folds",
})

vim.keymap.set("n", "zR", require("ufo").openAllFolds, {
	desc = "Open all folds",
})

vim.keymap.set("n", "-", "<cmd>foldclose<CR>", {
	desc = "Close code fold",
})

vim.keymap.set("n", "+", "<cmd>foldopen<CR>", {
	desc = "Close code fold",
})

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})
-- vim: ts=2 sts=2 sw=2 et
