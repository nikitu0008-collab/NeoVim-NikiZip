local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"

if vim.fn.has("win32") == 1 then
  vim.env.PATH = vim.env.PATH .. ";" .. vim.fn.expand("~/.dotnet/tools")
else
  vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("~/.dotnet/tools")
end
