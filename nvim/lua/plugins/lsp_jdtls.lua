local lsp_bindKeymaps = require('cal.lspconfig.bind_keymaps')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/cal/.jdtls.workspaces/' .. project_name

return {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    opts = function()
        return {
            cmd = {
                '/home/cal/Programs/jdtls/bin/jdtls',
                '-data', workspace_dir
            },
            root_dir = vim.fn.getcwd(),
            on_attach = lsp_bindKeymaps
        }
    end,
    config = function(_, opts)
        local augroup = vim.api.nvim_create_augroup("Java", {clear = true})

        vim.api.nvim_create_autocmd("FileType", {
            group = augroup,
            pattern = { "java" },
            callback = function()
                require('jdtls').start_or_attach(opts)
            end
        });
    end
}
