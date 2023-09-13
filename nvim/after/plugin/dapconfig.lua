local dap = require 'dap'

dap.defaults.fallback.external_terminal = {
	command = "tmux",
	args = { "split-pane", }
}
