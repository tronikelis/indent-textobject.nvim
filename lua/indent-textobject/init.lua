local M = {}

function M.select_inner()
	require("indent-textobject.main").select_indent(0)
end
function M.select_around()
	require("indent-textobject.main").select_indent(-1)
end

function M.goto_inner_top()
	vim.cmd(require("indent-textobject.main").indent_cmd_top(0))
end
function M.goto_inner_bot()
	vim.cmd(require("indent-textobject.main").indent_cmd_bot(0))
end

function M.goto_around_top()
	vim.cmd(require("indent-textobject.main").indent_cmd_top(-1))
end
function M.goto_around_bot()
	vim.cmd(require("indent-textobject.main").indent_cmd_bot(-1))
end

return M
