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

setv("<C-c>", '"+y'); -- copy to clipboard
setn("<leader><leader>h", function() vim.cmd[[ set hls! ]] end) -- toggle highlighting
setn("<leader><leader>b", function() vim.cmd[[ Gitsigns toggle_current_line_blame ]] end) -- toggle highlighting
setn("<M-l>", "<cmd>Lazy<cr>"); -- Plugin Manager
setn("<M-q>", "<cmd>bd<cr>");
setn("<M-Q>", "<cmd>qa!<cr>");

setn("<leader>o", function()
    vim.cmd [[so %]]
    print('File sourced')
end);

setn("<M-h>", "<cmd>wincmd h<cr>");
setn("<M-j>", "<cmd>wincmd j<cr>");
setn("<M-k>", "<cmd>wincmd k<cr>");
setn("<M-l>", "<cmd>wincmd l<cr>");

setn("<M-H>", "<cmd>vertical res -1<cr>");
setn("<M-J>", "<cmd>horizontal res +1<cr>");
setn("<M-K>", "<cmd>horizontal res -1<cr>");
setn("<M-L>", "<cmd>vertical res +1<cr>");

setn("<Esc>l", "<cmd>vertical res +1<cr>");

setn("<Esc>l", "<cmd>vertical res +1<cr>");
sett("<Esc>", "<C-\\><C-N>");

vim.keymap.set({'i', 'n', 'v'}, '<C-a>', '<esc>ggVG')
