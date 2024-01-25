return {
    'karb94/neoscroll.nvim',
    lazy = false,
    init = function()
        require('neoscroll').setup({
            hide_cursor = true,
            respect_scrolloff = true,
            cursor_scrolls_alone = true,
            easing_function = 'quadratic'
        })

        local t = {
            ['<C-j>'] = {'scroll', { '0.05', 'false', '100'}},
            ['<C-k>'] = {'scroll', {'-0.05', 'false', '100'}},

            ['<C-J>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}},
            ['<C-K>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}},
        }
        require('neoscroll.config').set_mappings(t)
    end,
}
