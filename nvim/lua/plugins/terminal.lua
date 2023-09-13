return {
    'numToStr/FTerm.nvim',
    config = true,
    keys = {
        { "<M-r>", function() require('FTerm').toggle() end },
        { "<M-r>", "<C-\\><C-N><cmd>lua require('FTerm').toggle()<cr>", mode = "t" },
        {
            "<leader>;r", -- [r]un test on terminal
            function()
                require('FTerm').scratch({cmd = {'mvn', 'test'}})
            end
        }
    }
}
