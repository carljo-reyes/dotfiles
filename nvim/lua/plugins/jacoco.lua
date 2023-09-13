return {
    'dsych/blanket.nvim',
    ft = 'java',
    opts = function()
        local currentFileDirectory = vim.fn.expand('%:p:h')
        local modulePom = vim.fs.find('pom.xml', { upward = true, path = currentFileDirectory })[1]
        local coverageFile = vim.fs.dirname(modulePom) .. '/target/site/jacoco/jacoco.xml'
        return {
            report_path = coverageFile,
            signs = {
                -- incomplete_branch = "〰",
                -- uncovered = "❌",
                -- covered = "✅",
            }
        }
    end,
    config = function(_, opts)
        local augroup = vim.api.nvim_create_augroup("JaCoCo", {clear = true})
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            group = augroup,
            callback = function()
                require('blanket').setup(opts)
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
