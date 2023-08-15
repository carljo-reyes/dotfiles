return {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
        transparent = true
    },
    init = function()
        vim.cmd[[colorscheme tokyonight]]
    end
}

