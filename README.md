# ⚡ NeoVim-NikiZip

### *Modern C++ & C# Development Environment for Neovim*

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet?logo=neovim&style=flat-square)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue?logo=lua&style=flat-square)](https://www.lua.org/)
[![clangd](https://img.shields.io/badge/clangd-17+-green?logo=llvm&style=flat-square)](https://clangd.llvm.org/)
[![.NET](https://img.shields.io/badge/.NET-8.0+-purple?logo=dotnet&style=flat-square)](https://dotnet.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

> **Backend‑grade editor setup** – Fast, modular, and tailored for modern C++ and C# development.  
> No distractions, just smart tooling for large codebases and competitive programming.

---

## 🖥️ Visual Tour

<div align="center">
  <img src="images/scr4.png" alt="NeoVim-NikiZip workspace" width="90%">
  <br>
  <em>⚡ Main workspace – C++ code with LSP diagnostics, autocompletion, and a clean UI</em>
</div>

---

## ✨ Core Features

| Area | Tools |
| :--- | :--- |
| **LSP** | `clangd` (C++), `OmniSharp` / `csharp-ls` (C#) |
| **Completion** | `nvim-cmp` + snippets + LSP |
| **Navigation** | `telescope.nvim` (files, grep, diagnostics, symbols) |
| **Syntax** | Tree‑sitter (C++, C#, and 40+ others) |
| **Formatting** | `clang-format` (C++), LSP formatting (C#) |
| **Project** | Automatic detection of `compile_commands.json`, `.sln`, `.csproj` |
| **Performance** | `lazy.nvim` – plug‑and‑play, lazy loading, fast startup |

---

## 📋 Requirements

| Tool | Version | Check |
| :--- | :--- | :--- |
| Neovim | ≥ 0.9 (0.10+ recommended) | `nvim --version` |
| Git | ≥ 2.30 | `git --version` |
| curl | ≥ 7.68 | `curl --version` |
| clangd | ≥ 15 | `clangd --version` |
| .NET SDK | ≥ 8.0 | `dotnet --version` |
| ripgrep / fd | (optional, for Telescope) | `rg --version` / `fd --version` |

> **Nerd Font** – optional, but recommended for icons (e.g., `FiraCode Nerd Font`).

---

## 📦 Installation

### 1. Backup existing config (if any)
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
2. Clone this repository
bash

git clone https://github.com/nikitu0008-collab/NeoVim-NikiZip.git ~/.config/nvim

3. Install plugins & LSP servers
bash

nvim --headless +Lazy! sync +qa

Or just run nvim – lazy.nvim will automatically install everything.

    Note: The first launch will download all plugins. LSP servers (clangd, omnisharp) are managed by mason.nvim and will be installed automatically when you open a C++ or C# file.

4. Verify LSP is active

Open a C++ file and run:
vim

:LspInfo

You should see clangd as an active client. For C#, open any .cs file – omnisharp or csharp-ls will attach.
🛠 Customization (backend‑style)

All configuration lives in lua/. It’s modular, so you can tweak without breaking things.
Change colorscheme

Edit lua/plugins/theme.lua – replace 'catppuccin' with your favourite.
Add another LSP (e.g., pyright, rust_analyzer)

Open lua/lsp.lua and append to the servers list.
Adjust clangd flags

Create .clangd in your project root:
yaml

CompileFlags:
  Add: [-std=c++20, -Iinclude]

C# project file

The LSP will automatically recognise .sln or .csproj. To customise OmniSharp, see lua/lsp/omnisharp.lua.
Key mappings

All shortcuts are defined in lua/keymaps.lua. Examples:
Action	Mapping
Find files	<leader>ff
Live grep	<leader>fg
Go to definition	gd
Rename symbol	<leader>rn
Code actions	<leader>ca

    <leader> is space by default.

🧩 Project structure (what you can expect)
text

~/.config/nvim/
├── init.lua              # Entry point, loads lazy.nvim
├── lua/
│   ├── options.lua       # Neovim options (tabs, line numbers, etc.)
│   ├── keymaps.lua       # Global mappings
│   ├── lazy.lua          # Plugin manager setup
│   ├── plugins/          # Plugin configurations
│   │   ├── lsp.lua       # LSP + Mason setup
│   │   ├── cmp.lua       # Autocompletion
│   │   ├── telescope.lua # File finder
│   │   └── treesitter.lua# Syntax highlighting
│   └── ...

🚀 Tips for backend developers

    Compilation database – Use CMake with -DCMAKE_EXPORT_COMPILE_COMMANDS=ON to let clangd understand your project.

    C# solution – dotnet build works out of the box; LSP picks up references.

    Formatting on save – Enabled by default for both C++ and C#. Disable in lua/plugins/lsp.lua.

    Debugging – You can integrate nvim-dap with netcoredbg for C#. (Not included by default – add it yourself.)

    Quick switching – :Telescope projects if you add project.nvim plugin.

🙏 Acknowledgements

Built on the shoulders of:

    Neovim

    lazy.nvim

    nvim-lspconfig

    mason.nvim

    nvim-cmp

    telescope.nvim

    nvim-treesitter

📄 License

MIT – free to use, modify, and share.

⭐ If this setup makes your backend coding smoother, give it a star!
