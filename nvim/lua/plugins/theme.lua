return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        on_highlights = function(hl, c)
            hl.NvimTreeNormal = {
                bg = c.none,
                fg = c.none
            }

            hl.NvimTreeNormalNC = {
                bg = c.none,
                fg = c.none
            }
        end
    },
    init = function()
        vim.cmd[[colorscheme tokyonight]]
    end
}

