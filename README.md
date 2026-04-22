# ⚡ NeoVim-NikiZip
### *Modern C++ Development Environment for Neovim*

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet?logo=neovim)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue)](https://www.lua.org/)
[![clangd](https://img.shields.io/badge/clangd-17+-green)](https://clangd.llvm.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> A fast, feature-rich, and beautifully configured Neovim setup, finely tuned for modern **C++** development with `clangd` LSP.
> Perfect for daily coding, large projects, or competitive programming.

![Neovim C++ Demo](screenshot.png)
---

## ✨ Key Features

- **🧠 Smart Code Intelligence** – Powered by `clangd` LSP: go to definition, find references, rename symbols, code actions, and semantic highlighting.
- **🔮 Intelligent Autocompletion** – `nvim-cmp` + snippets for fast and accurate code suggestions.
- **🎨 Beautiful Syntax Highlighting** – Tree-sitter for C++ (and many other languages).
- **🔍 Lightning Fast Navigation** – `telescope.nvim` to find files, grep symbols, and search diagnostics.
- **🧹 Auto-Formatting** – `clang-format` integration (on save or manually).
- **🧩 Modular & Modern** – Built with `lazy.nvim` for blazing-fast startup and easy customization.

## 📋 Requirements

Before you begin, ensure your system meets the following requirements:

| Tool | Minimum Version | Purpose | Check Command |
| :--- | :--- | :--- | :--- |
| **Neovim** | 0.9+ (0.10+ recommended) | Core editor | `nvim --version` |
| **Git** | 2.30+ | Plugin management | `git --version` |
| **curl** | 7.68+ | Downloading plugins & LSPs | `curl --version` |
| **clangd** | 15+ | C++ LSP server | `clangd --version` |
| **clang-format** | (Optional) | Code formatting | `clang-format --version` |
| **Nerd Font** | (Optional) | Icons and UI elements | (e.g., `FiraCode Nerd Font`) |

> **💡 Pro Tip:** For the best experience, also install `ripgrep` (for Telescope live grep) and `fd` (for faster file finding).

## 📦 Installation

Follow these steps to get up and running in no time.

### 1. Backup Your Existing Configuration (if any)

It's always a good idea to save your current setup before installing a new one.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
2. Clone the Repository

Clone this configuration directly into your Neovim config directory.
bash

git clone https://github.com/nikitu0008-collab/NeoVim-NikiZip.git ~/.config/nvim

3. Install Plugins

Open Neovim. The lazy.nvim plugin manager will automatically install all required plugins.
bash

nvim

Wait for the installation to complete. You might see a message like [Lazy] Installing .... Once it's done, restart Neovim.

    Note: If you encounter any issues, ensure curl is installed and accessible from your terminal.

4. Verify the Setup

Open a C++ file (e.g., main.cpp). Check that clangd is attached by running:
vim

:LspInfo

You should see clangd listed as an active client. Try typing std:: to see the autocompletion menu.
🛠 Customization

This configuration is built to be easily customizable. All settings are organized in the lua/ directory.

    Change Colorscheme: Edit lua/plugins/theme.lua (or similar) and replace the theme.

    Add LSP Servers: Modify lua/lsp.lua to include additional LSPs (e.g., pyright, rust_analyzer).

    Adjust clangd Flags: Create a .clangd file in your project root:
    yaml

    CompileFlags:
      Add: [-std=c++20, -Iinclude]

🙏 Acknowledgements

This configuration stands on the shoulders of giants. Special thanks to the creators of:

    Neovim

    lazy.nvim

    clangd

    nvim-lspconfig

    nvim-cmp

    telescope.nvim

    nvim-treesitter

📝 License

This project is distributed under the MIT License. See the LICENSE file for more information.

⭐ If you find this configuration useful, please consider giving it a star on GitHub!
text
