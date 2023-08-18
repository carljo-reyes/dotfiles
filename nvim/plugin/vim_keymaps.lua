local setn = function(lhs, rhs)
    vim.keymap.set('n', lhs, rhs)
end

local setv = function(lhs, rhs)
    vim.keymap.set('v', lhs, rhs)
end

setn("<M-l>", "<cmd>Lazy<cr>");
setn("<M-q>", "<cmd>bd<cr>");
setn("<M-Q>", "<cmd>qa!<cr>");

setn("<C-h>", "<cmd>wincmd h<cr>");
setn("<C-j>", "<cmd>wincmd j<cr>");
setn("<C-k>", "<cmd>wincmd k<cr>");
setn("<C-l>", "<cmd>wincmd l<cr>");

setv("<C-c>", '"+y'); -- copy to clipboard
