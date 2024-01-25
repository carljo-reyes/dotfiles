return {
    {
        'lewis6991/gitsigns.nvim',
        lazy = false,
        opts = {
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '-' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '+' },
            },
            numhl      = true,
            linehl     = false,
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 0,
            },
        },
        config = true,
        keys = {
            { '<M-b>', function() require('gitsigns.actions').toggle_current_line_blame() end},
            { '<M-g>b', function() require('gitsigns.actions').toggle_current_line_blame() end},
            { '<M-g>d', function() require('gitsigns.actions').toggle_deleted() end},
            { '<M-g>D', function() require('gitsigns.actions').toggle_word_diff() end},
            { '<M-g>X', function() require('gitsigns.actions').reset_hunk() end},
            { '<M-G>', function()
                vim.ui.input({ prompt = 'Change base to: ' }, function(input)
                    if (input == nil) then return end
                    vim.cmd([[Gitsigns change_base ]] .. input)
                end)
            end },
            { 'g[', function() require('gitsigns.actions').prev_hunk() end},
            { 'g]', function() require('gitsigns.actions').next_hunk() end},
        }
    },
    {
        'tpope/vim-fugitive',
        lazy = false,
        keys = {
            { '<M-B>', [[<CMD>Git blame<CR>]] }
        }
    },
}
