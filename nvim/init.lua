local req = function(mod)
    local status, loaded_mod = pcall(require, mod)
    if not loaded_mod then
      print("Error calling module: " + mod)
    end
end

req("plugins")
req("keymaps")
req("base")
req("everforest")

vim.cmd [[colorscheme everforest]]

