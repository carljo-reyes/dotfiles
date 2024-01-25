-------------
-- This file contains vim related keymaps
-- * Leader key is defined in {root}/init.lua
-- * Plugin-specific keymaps reside in their own plugin specs
--   under {root}/lua/plugins
--
-------------

local setn = function(lhs, rhs)
    vim.keymap.set('n', lhs, rhs)
end

local setv = function(lhs, rhs)
    vim.keymap.set('v', lhs, rhs)
end

local sett = function(lhs, rhs)
    vim.keymap.set('t', lhs, rhs)
end

-- clipboard
setn("<leader>yf", "<cmd>let @+ = expand('%')<cr>") -- copy filename
setv("<C-c>", '"+y');
setv("gy", [["+y]])    
setn("gy", [["+y]])
setn("gY", [["+yg_]])
setv("<CR>", [[y]])

-- highlighting
setn("<M-s>", function() vim.cmd[[ set hls ]] end) -- toggle highlighting
setn("<Esc>", function() vim.cmd[[ nohls ]] end) -- toggle highlighting

setn("<leader>l", "<cmd>Lazy<cr>"); -- Plugin Manager

-- buffers
setn("<C-d>", "<cmd>bd<cr>");
setn("<M-q>", "<cmd>bd!<cr>");
setn("<M-Q>", "<cmd>qa!<cr>");

setn("<leader>o", function()
    vim.cmd [[so %]]
    print('File sourced')
end);

setn("<M-H>", "<cmd>vertical res -1<cr>");
setn("<M-J>", "<cmd>horizontal res +1<cr>");
setn("<M-K>", "<cmd>horizontal res -1<cr>");
setn("<M-L>", "<cmd>vertical res +1<cr>");

setn("<Esc>l", "<cmd>vertical res +1<cr>");

setn("<Esc>l", "<cmd>vertical res +1<cr>");
sett("<Esc>", "<C-\\><C-N>");

setn("<M-n>", "<cmd>tabnew<cr>")
setn("<M-,>", "<cmd>tabprev<cr>")
setn("<M-.>", "<cmd>tabnext<cr>")
setn("<M-x>", "<cmd>tabclose<cr>")

vim.keymap.set({'n', 'v'}, 'x', [["_x]])
vim.keymap.set({'i', 'n', 'v'}, '<C-a>', '<esc>ggVG')
