return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        close_if_last_window = true,
        window = {
            position = "float",
        },
        filesystem = {
            group_empty_dirs = true,
            window = {
                fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                    ["<M-j>"] = "move_cursor_down",
                    ["<M-k>"] = "move_cursor_up",
                },
            }
        }
    },
    keys = {
        {"<M-e>", "<cmd>Neotree toggle reveal<cr>", desc = "Explorer"},
        {"<leader>ef", "<cmd>Neotree toggle float<cr>", desc = "Explorer"},
        {"<leader>eh", "<cmd>Neotree toggle left<cr>", desc = "Explorer"},
        {"<leader>el", "<cmd>Neotree toggle right<cr>", desc = "Explorer"},
    }
}
