local lsp_bindKeymaps = require('cal.lspconfig.bind_keymaps')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/cal/.jdtls.workspaces/' .. project_name

return {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    lazy = false,
    opts = function()
        local bundles = {
            vim.fn.glob('/home/cal/Programs/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', true),
        }
        vim.list_extend(bundles, vim.split(vim.fn.glob("/home/cal/Programs/vscode-java-test/server/*.jar", true), "\n"))

        return {
            cmd = {
                os.getenv("JDTLS_JAVA_HOME") .. '/bin/java',
                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.protocol=true',
                '-Dlog.level=ALL',
                '-Xmx1g',
                os.getenv("JDTLS_JVM_ARGS"),
                '--add-modules=ALL-SYSTEM',
                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                '-jar', '/home/cal/Programs/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
                '-configuration', '/home/cal/Programs/jdtls/config_linux',
                '-data', workspace_dir,
            },
            root_dir = vim.fn.getcwd(),
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            { name = 'JavaSE-17', path = '/home/cal/.sdkman/candidates/java/17.0.8-tem/' },
                            { name = 'JavaSE-1.8', path = '/home/cal/.sdkman/candidates/java/8.0.352-amzn/' }
                        }
                    }
                }
            },
            init_options = {
                bundles = bundles
            },
            on_attach = function (client, bufnr)
                lsp_bindKeymaps(client, bufnr)
            end,
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
    end,
    keys = {
        {
            "<leader>;c",
            function()
                require('jdtls.dap').setup_dap()
                require('jdtls').test_nearest_method()
            end
        }
    }
}
