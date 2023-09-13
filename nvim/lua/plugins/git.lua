return {
    {
        'lewis6991/gitsigns.nvim',
        config = {
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
                virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
                delay = 0,
            },
        }
    },
    {
        'tpope/vim-fugitive'
    },
}
