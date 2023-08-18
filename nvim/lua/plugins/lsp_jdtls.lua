return {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    opts = {
        cmd = { '/path/to/jdt-language-server/bin/jdtls' },
        root_dir = vim.fs.root_dir
    },
    config = function(jdtls, opts)
        jdtls.start_or_attach(opts)
    end
}
