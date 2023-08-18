return {
    'dsych/blanket.nvim',
    init = function()
        local blanket = require('blanket')
        local ok, _ = pcall(blanket.setup, {
            report_path = vim.fn.getcwd().."/target/site/jacoco/jacoco.xml",
        });
    end
}
