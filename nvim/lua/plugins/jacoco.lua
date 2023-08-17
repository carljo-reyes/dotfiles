return {
    'dsych/blanket.nvim',
    init = function()
        require('blanket').setup({
            report_path = vim.fn.getcwd().."/target/site/jacoco/jacoco.xml",
            filetypes = "java"
        })
    end
}
