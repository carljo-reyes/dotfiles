return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
            modules = {},
            sync_install = false,
            ignore_install = {},

            ensure_installed = {},
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-Space>",
                    node_incremental = "J",
                    node_decremental = "K",
                    -- scope_incremental = "K",
                }
            }
        })
    end
}
