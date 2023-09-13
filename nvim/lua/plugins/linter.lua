return {
    "mfussenegger/nvim-lint",
    enabled = false,
    config = function()
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function ()
                require("lint").try_lint()
            end
        })
    end
}