return {
    'github/copilot.vim',
    config = function()
        vim.g.copilot_node_command = "/home/cal/.nvm/versions/node/v18.17.1/bin/node"
        vim.cmd[[ imap <silent><script><expr> <C-a> copilot#Accept("\<CR>") ]]
        vim.copilot_no_tab_map = true
    end,
}
