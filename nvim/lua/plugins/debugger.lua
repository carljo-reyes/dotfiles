return {
    "rcarriga/nvim-dap-ui",
    dependencies = {{ "mfussenegger/nvim-dap" }},
    config = true,
    keys = {
        { "<leader>dt", function() require('dapui').toggle() end },
        { "<leader>D", function() require('dap').toggle_breakpoint() end },
        { "<leader>dp", function() require('dap').continue() end },
        { "<leader>dd", function() require('dap').step_over() end },
        { "<leader>dg", function() require('dap').step_into() end },
        { "<leader>dr", function() require('dap').repl.open() end },
        { "<leader>;m",
            function()
                require('jdtls').setup_dap()
                require('dap').repl.open()
            end
        },
    }
}
