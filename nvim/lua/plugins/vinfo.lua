return {
    'alx741/vinfo',
    keys = {
        { "<M-v>", function()
            vim.ui.input({ prompt = 'Info: ' }, function(input)
                if (input == nil) then return end
                vim.cmd('Vinfo ' .. input)
            end)
        end }
    }
}
