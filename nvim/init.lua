vim.g.mapleader = " "

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- lazy.nvim
vim.opt.rtp:prepend(lazypath)

local opts = {
    change_detection = {
        enabled = true, notify = false
    },
    install = {
        missing = true,
        colorscheme = { "tokyonight" },
    }
}
require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.debugger" },
    { import = "plugins.lsp" }
}, opts)
