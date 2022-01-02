local vim = vim
local api = vim.api

local M = {}

function M.create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command('augroup '..group_name)
		api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			api.nvim_command(command)
		end
		api.nvim_command('augroup END')
	end
end

function M.map(key)
  local opts = {noremap = true, silent=true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end


function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return M

