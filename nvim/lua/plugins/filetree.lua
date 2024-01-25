return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    init = function()
        vim.g.nvim_tree_last_opened_source = "buffers"
    end,
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
        },
        event_handlers = {
            {
                event = "neo_tree_window_after_open",
                handler = function(arg)
                    vim.g.nvim_tree_last_opened_source = arg.source
                end
            }
        }
    },
    keys = {
        {"<M-e>", "<cmd>Neotree toggle reveal source=last<cr>", desc = "Explorer"},
        {"<M-E>", function()
            vim.ui.input({ prompt = 'Change base to: ' }, function(input)
            if (input == nil) then return end
                vim.cmd([[Neotree source=git_status git_base=]] .. input)
            end)
        end, desc = "Explorer"},
        {"<leader>ef", "<cmd>Neotree float<cr>", desc = "Explorer float"},
        {"<leader>eh", "<cmd>Neotree left<cr>", desc = "Explorer left"},
        {"<leader>el", "<cmd>Neotree right<cr>", desc = "Explorer right"},
    }
}
