return {
    'dsych/blanket.nvim',
    ft = 'java',
    init = function()
        local augroup = vim.api.nvim_create_augroup("JaCoCo", {clear = true})
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            group = augroup,
            callback = function()
                print 'jacoco foo'
                local currentFileDirectory = vim.fn.expand('%:p:h')
                local modulePom = vim.fs.find('pom.xml', { upward = true, path = currentFileDirectory })[1]
                local coverageFile = vim.fs.dirname(modulePom) .. '/target/site/jacoco/jacoco.xml'

                require('blanket').setup({
                    report_path = coverageFile
                })
            end
        })
    end,
    keys = {
        { "<M-t>o", function() require('blanket').start() end },
        { "<M-t>O", function() require('blanket').stop() end },
        { "<M-t>r", function() require('blanket').refresh() end },
        { "<M-t>p", function() require('blanket').pick_report_path() end },
    },
}
