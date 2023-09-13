local MASON_PATH = vim.fn.stdpath('data') .. '/mason'

return {
    'https://gitlab.com/schrieveslaach/sonarlint.nvim',
    dependencies = {
        'mfussenegger/nvim-jdtls'
    },
    config = {
        server = {
            cmd = {
                MASON_PATH .. '/bin/sonarlint-language-server',
                '-stdio',
                '-analyzers',
                MASON_PATH .. "/share/sonarlint-analyzers/sonarjava.jar",
            }
        },
        filetypes = {
            -- Requires nvim-jdtls, otherwise an error message will be printed
            'java',
        }
    }
}
