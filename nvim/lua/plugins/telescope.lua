return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    opts = function()
        local actions = require('telescope.actions')
        return {
            defaults = {
                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<c-d>"] = actions.delete_buffer + actions.move_to_top
                    }
                }
            }
        }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>h", function() require('telescope.builtin').help_tags() end },
        { "<leader><leader>", function() require('telescope.builtin').buffers() end },

        { "<M-f>", function() require('telescope.builtin').find_files() end },
        { "<M-F>", function() require('telescope.builtin').live_grep() end },
        { "<leader>k", '<cmd>Telescope keymaps<cr>' },
    }
}
