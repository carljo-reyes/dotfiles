-- for type checking, documentation, and autocompletion
return {
    'folke/neodev.nvim',
    dependencies = {
        { "rcarriga/nvim-dap-ui" }
    },
    config = {
        library = {
            plugins = { "nvim-dap-ui" },
            types = true
        },
    },
}
