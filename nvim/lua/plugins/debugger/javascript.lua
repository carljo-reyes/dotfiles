local DEBUGGER_PATH = '/home/cal/.local/share/nvim/lazy/vscode-js-debug'

return {
    'mxsdev/nvim-dap-vscode-js',
    lazy = false,
    dependencies = {
        { 'mfussenegger/nvim-dap' },
        {
            'microsoft/vscode-js-debug',
            build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
        }
    },
    opts = {
        node_path = "/home/cal/.nvm/versions/node/v18.17.1/bin/node",
        debugger_path = DEBUGGER_PATH, -- Path to vscode-js-debug installation.
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    },
    config = true,
    init = function()
        for _, language in ipairs { "typescript", "javascript" } do
            require("dap").configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach to process", -- works but disconnects upon server restart. needs manual reconnection
                    processId = require("dap.utils").pick_process,
                    rootPath = "${workspaceFolder}",
                    cwd = "${workspaceFolder}",
                    restart = true,
                },
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "npm run dev-debug (external)", -- doesn't attach to app
                    -- trace = true, -- include debugger info
                    runtimeExecutable = "npm",
                    runtimeArgs = {
                        "run",
                        "dev-debug",
                    },
                    rootPath = "${workspaceFolder}",
                    cwd = "${workspaceFolder}",
                    console = "externalTerminal",
                    internalConsoleOptions = "neverOpen",
                },
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "npm run dev (console)", -- works flawlessy
                    -- trace = true, -- include debugger info
                    runtimeExecutable = "npm",
                    runtimeArgs = {
                        "run",
                        "dev",
                    },
                    rootPath = "${workspaceFolder}",
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    internalConsoleOptions = "neverOpen",
                },
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Debug Jest Tests",
                    -- trace = true, -- include debugger info
                    runtimeExecutable = "node",
                    runtimeArgs = {
                        "./node_modules/jest/bin/jest.js",
                        "--runInBand",
                    },
                    rootPath = "${workspaceFolder}",
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    internalConsoleOptions = "neverOpen",
                },
            }
        end
    end,
}
