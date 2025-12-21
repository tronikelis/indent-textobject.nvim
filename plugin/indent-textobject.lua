vim.keymap.set("v", "ii", function()
	require("indent-textobject.main").select_indent(0)
end)

vim.keymap.set("v", "ai", function()
	require("indent-textobject.main").select_indent(-1)
end)

vim.keymap.set("o", "ii", "<cmd>normal vii<cr>")
vim.keymap.set("o", "ai", "<cmd>normal vai<cr>")

vim.keymap.set({ "n", "v" }, "[i", function()
	vim.cmd(require("indent-textobject.main").indent_cmd_top(0))
end)

vim.keymap.set({ "n", "v" }, "]i", function()
	vim.cmd(require("indent-textobject.main").indent_cmd_bot(0))
end)

vim.keymap.set({ "n", "v" }, "[I", function()
	vim.cmd(require("indent-textobject.main").indent_cmd_top(-1))
end)

vim.keymap.set({ "n", "v" }, "]I", function()
	vim.cmd(require("indent-textobject.main").indent_cmd_bot(-1))
end)
