local map = vim.keymap.set
local remap = function (m, l, r)
  map(m, l, r, {remap = true})
end

vim.g.mapleader = ' '

----- (Window) Splits and Tabs
map('n', '<C-w>n', '<CMD>vsplit<CR>')  -- spawn pane to the right
map('n', '<C-w>m', '<CMD>split<CR>')   -- spawn pane below
map('n', '<C-w>w', '<CMD>tabnew<CR>')  -- new tab
map('n', '<C-w><TAB>', '<CMD>tabnew<CR>') -- new tab
map('n', '<leader><TAB>', '<CMD>tabnew<CR>') -- new tab

----- Commands
local close_buffer = '<CMD>bd<CR>' 
local force_quit  = '<CMD>q!<CR>'

local save = '<CMD>update<CR>'

local window = '<C-w>'
local next_buffer = '<CMD>bn<CR>'

------- Maps
map('n', '<ESC>', '<CMD>nohls<CR>')
map('n', 'q', close_buffer)
map('n', 'Q', force_quit)

map('n', '<leader>s', save)
remap('n', '<leader>w', window)
map('n', '<leader>b', next_buffer)

local command_mode = {
  Quit = 'q',
  remove_highlight = {
    ["a"] = 'b'
  }
}
