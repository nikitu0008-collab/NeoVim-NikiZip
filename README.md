# 🚀 NeoVim-NikiZip

### *Zero‑config Neovim distro for C++ & C# — just code, no tinkering*

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet?logo=neovim&style=flat-square)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1-blue?logo=lua&style=flat-square)](https://www.lua.org/)
[![C++](https://img.shields.io/badge/C++-clangd-00599C?logo=cplusplus&style=flat-square)](https://clangd.llvm.org/)
[![C#](https://img.shields.io/badge/C%23-OmniSharp-239120?logo=csharp&style=flat-square)](https://github.com/OmniSharp/omnisharp-roslyn)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Stars](https://img.shields.io/github/stars/nikitu0008-collab/NeoVim-NikiZip?style=flat-square)](https://github.com/nikitu0008-collab/NeoVim-NikiZip)

> **Designed for backend engineers who want a blazing‑fast IDE without spending weeks configuring LSP, snippets, and formatting.**  
> Open a `.cpp` or `.cs` file — everything just works.

---

## ✨ Why this config?

| Problem | Solution |
|:--------|:---------|
| ❌ LSP setup for C++/C# is painful | ✅ `clangd` + `OmniSharp` auto‑configured |
| ❌ `compile_commands.json` missing | ✅ Automatic detection + hints how to generate |
| ❌ Navigating huge codebases is slow | ✅ Telescope with smart ignores (build/, bin/, obj/) |
| ❌ Formatting on save never works | ✅ `clang-format` & LSP formatting enabled out of the box |
| ❌ Too many plugins, no idea what they do | ✅ Minimal, modular, documented in `lua/` |

**No hidden costs. No hours of dotfile tweaking.**

---

## 🖥️ See it in action

<div align="center">
  <!-- Replace with your own GIF (use vhs or asciinema) -->
  <img src="https://your-domain.com/demo.gif" alt="Demo of NeoVim-NikiZip" width="90%">
  <br>
  <em>⚡ LSP diagnostics, autocompletion, Telescope search – all at your fingertips</em>
</div>

> *A static screenshot is nice, but a 10‑second GIF tells the whole story. [Record your own](https://github.com/charmbracelet/vhs) and replace the link.*

---

## 🎯 One‑line install (really)

```
git clone https://github.com/nikitu0008-collab/NeoVim-NikiZip.git ~/.config/nvim && nvim --headless +'Lazy! sync' +qa

Then open any C++ or C# file. That's it.

    First launch downloads all plugins and LSP servers automatically. You’ll see Mason installing clangd and omnisharp in the background. No extra commands.

📋 What you get – Core features
Area	Tools
LSP	clangd (C++, with compile_commands.json), OmniSharp (C#, with .sln/.csproj support)
Completion	nvim-cmp + snippets + LSP – appears as you type
Navigation	telescope.nvim – find files, grep, diagnostics, symbols (ignores build/, bin/, obj/)
Syntax	Tree‑sitter for C++, C#, and 40+ other languages
Formatting	Auto‑format on save for both C++ and C#
Project detection	Automatically picks up compile_commands.json (CMake) or .sln/.csproj (dotnet)
🔑 Default key mappings
Action	Shortcut
Find files	<leader>ff
Live grep	<leader>fg
Go to definition	gd
Rename symbol	<leader>rn
Code actions	<leader>ca
LSP info	<leader>li

(<leader> = space)
🚀 Quick start for C++ / C# projects
C++ (CMake)

# Generate compilation database
cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
# clangd will pick it up automatically

C# (dotnet)

dotnet new console -n MyApp
cd MyApp
nvim Program.cs   # LSP attaches, formatting works, references resolved

🔧 Customisation (you won't need it, but here's how)

All settings are in lua/ – modular, easy to tweak.

    Change colorscheme – edit lua/plugins/theme.lua

    Add another LSP (e.g., pyright, rust_analyzer) – add to lua/lsp.lua

    Disable auto‑format – comment out the format_on_save line in lua/plugins/lsp.lua

For advanced changes, see CUSTOMIZATION.md (you can create this file later).
📦 Requirements (most are already on your machine)
Tool	Minimum version	Why
Neovim	0.9+ (0.10 recommended)	Core editor
Git	2.30+	Clone and plugin management
curl	7.68+	Downloader for plugins
clangd	15+	C++ LSP (will be installed by Mason)
.NET SDK	8.0+	C# LSP (will be installed by Mason)
ripgrep or fd	any	For Telescope search (optional but recommended)

    Nerd Font (optional) – makes icons prettier. Try FiraCode Nerd Font.

💬 Community & support

    📢 Telegram channel – t.me/neovim_nikizip (ask questions, share feedback)

    🐙 GitHub Issues – bug reports, feature requests

    ⭐ Star this repo – helps others discover a smooth C++/C# Neovim experience

🙏 Credits

Built with ❤️ using lazy.nvim, nvim-lspconfig, mason.nvim, and the amazing Neovim community.
📄 License

MIT – free to use, modify, and share.

If this config saves you hours of configuration, give it a star ⭐ – it means the world!
