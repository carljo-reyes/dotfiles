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
                        ["<esc>"] = actions.close,
                        ["<M-j>"] = actions.move_selection_next,
                        ["<M-k>"] = actions.move_selection_previous
                    }
                }
            }
        }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>f", function() require('telescope.builtin').find_files() end },
        { "<leader>F", function() require('telescope.builtin').live_grep() end },
        { "<M-f>", function() require('telescope.builtin').buffers() end },
    }
}
