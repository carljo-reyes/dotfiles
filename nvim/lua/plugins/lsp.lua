local servers = require('cal.lspconfig.servers')
local lsp_bindKeymaps = require('cal.lspconfig.bind_keymaps')

return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
        },
        config = {
             ensure_installed = vim.tbl_keys(servers),
        },
        keys = {
            { "<M-m>", "<cmd>Mason<cr>", desc = "Mason" },
        }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        init = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            require('mason-lspconfig').setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = lsp_bindKeymaps,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    }
                end
            }
        end
    }
}
