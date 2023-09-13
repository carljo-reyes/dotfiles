return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        { "mfussenegger/nvim-dap" }
    },
    config = {
        layouts = {
            {
                position = "left",
                size = 40,
                elements = {
                    {
                        id = "scopes",
                        size = 0.25
                    },
                    {
                        id = "breakpoints",
                        size = 0.25
                    },
                    {
                        id = "stacks",
                        size = 0.25
                    },
                    {
                        id = "watches",
                        size = 0.25
                    }
                },
            },
            {
                position = "right",
                size = 80,
                elements = {
                    {
                        id = "repl",
                        size = 0.2
                    },
                    {
                        id = "console",
                        size = 0.8
                    }
                },
            },
        },

    },
    keys = {
        { "<leader>d", function() require('dapui').toggle() end },
        { "<M-y>", function() require('dap').toggle_breakpoint() end },
        { "<M-u>", function() require('dap').step_over() end },
        { "<M-i>", function() require('dap').step_into() end },
        { "<M-o>", function() require('dap').step_out() end },
        { "<M-p>", function() require('dap').continue() end },
    }
}
