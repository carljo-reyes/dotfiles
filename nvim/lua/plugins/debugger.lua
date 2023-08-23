return {
    "rcarriga/nvim-dap-ui",
    dependencies = {{ "mfussenegger/nvim-dap" }},
    config = true,
    keys = {
        { "<leader>d", function() require('dapui').toggle() end },
        { "<M-y>", function() require('dap').toggle_breakpoint() end },
        { "<M-u>", function() require('dap').step_over() end },
        { "<M-i>", function() require('dap').step_into() end },
        { "<M-o>", function() require('dap').step_out() end },
        { "<M-p>", function() require('dap').continue() end },
    }
}
