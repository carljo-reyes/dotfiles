-- for type checking, documentation, and autocompletion
return {
    'folke/neodev.nvim',
    lazy = false,
    priority = 70,
    dependencies = {
        { "rcarriga/nvim-dap-ui" }
    },
    config = {
        root_dir = vim.fn.getcwd(),
        library = {
            plugins = { "nvim-dap-ui" },
            types = true
        },
    },
}
