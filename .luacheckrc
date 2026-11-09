-- Luacheck configuration for this Neovim config.
-- The "Neovim" standard declares the globals provided by the editor
-- (vim, vim.fn, vim.api, ...), so lint does not flag them as unknown.
std = "Neovim"

files = {
  "nvim/lua",
  "nvim/init.lua",
}

globals = {
  "vim",
}

max_line_length = 120
