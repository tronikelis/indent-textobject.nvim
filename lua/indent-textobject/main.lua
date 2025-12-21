local M = {}

---@param line integer
---@return integer?
local function get_line_indent(line)
	local data = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
	if data:match("^([ \t]*)$") then
		return
	end

	local indent = data:match("^([ \t]*).*$")
	return #assert(indent)
end

---@param step integer
---@param limit integer
local function find_indent(limit, step)
	local i = vim.api.nvim_win_get_cursor(0)[1]
	local prev_indent
	local prev_valid_indent

	for i = i, limit, step do
		local indent = get_line_indent(i)

		if not prev_indent then
			prev_indent = indent
		else
			if indent and indent < prev_indent then
				return prev_valid_indent or i
			end
		end

		if indent and indent >= prev_indent then
			prev_valid_indent = i
		end
	end
end

local function move_cursor_to_first_indent()
	local i = vim.api.nvim_win_get_cursor(0)[1]
	for i = i, vim.api.nvim_buf_line_count(0) do
		local indent = get_line_indent(i)
		if indent and indent > 0 then
			vim.api.nvim_win_set_cursor(0, { i, 0 })
			return
		end
	end
end

---@param offset integer
---@return string
function M.indent_cmd_top(offset)
	local top = find_indent(1, -1)
	if not top then
		top = "normal! gg"
	else
		top = top + offset
	end
	return tostring(top)
end

---@param offset integer
---@return string
function M.indent_cmd_bot(offset)
	local bot = find_indent(vim.api.nvim_buf_line_count(0), 1)
	if not bot then
		bot = "normal! G"
	else
		bot = bot - offset
	end
	return tostring(bot)
end

---@param offset integer
function M.select_indent(offset)
	move_cursor_to_first_indent()

	local top_cmd = M.indent_cmd_top(offset)
	local bot_cmd = M.indent_cmd_bot(offset)

	vim.cmd(top_cmd)
	vim.cmd("normal! _")
	vim.cmd("normal! o")
	vim.cmd(bot_cmd)
	vim.cmd("normal! g_")
end

return M
