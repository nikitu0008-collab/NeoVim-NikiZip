# 🚀 NeoVim-NikiZip

A lightweight Neovim configuration focused on **C++, Rust, C#, backend and systems development**.

The goal is simple: clone the configuration, start Neovim and get a practical development environment without manually assembling an LSP, formatter, debugger and plugin stack.

## Highlights

- C/C++: `clangd`, `clang-format`, `clang-tidy`, CMake tools and DAP support.
- Rust: `rustaceanvim`, `rust-analyzer`, `rustfmt` and Clippy integration.
- C#: `csharp_ls`.
- Completion: `nvim-cmp` + LuaSnip.
- Formatting: Conform with format-on-save.
- Linting: `nvim-lint`.
- Debugging: `nvim-dap`, DAP UI and `codelldb`.
- Navigation: Telescope, Neo-tree and Flash.
- Diagnostics: native diagnostics + Trouble.
- Terminal: ToggleTerm.
- Reproducible plugin versions through `lazy-lock.json`.

## Requirements

- Neovim **0.11+**
- Git
- `ripgrep` for live grep
- A Nerd Font for icons

Most development tools are installed through Mason on first launch.

## Installation

### Linux / macOS

```bash
git clone https://github.com/nikitu0008-collab/NeoVim-NikiZip.git ~/.config/nvim
nvim
```

### Windows PowerShell

```powershell
git clone https://github.com/nikitu0008-collab/NeoVim-NikiZip.git "$env:LOCALAPPDATA\nvim"
nvim
```

## Main key mappings

`<leader>` is `Space`.

| Action | Key |
|---|---|
| Find files | `<leader>ff` |
| Live grep | `<leader>fg` |
| File explorer | `<leader>e` |
| Format buffer | `<leader>cf` |
| Code action | `<leader>ca` |
| Rename symbol | `<leader>cr` |
| Toggle diagnostics | `<leader>xx` |
| Toggle terminal | `<leader>tt` |
| Toggle breakpoint | `<leader>db` |
| Continue debugging | `F5` |
| Step over | `F10` |
| Step into | `F11` |
| CMake build | `<leader>mb` |
| CMake run | `<leader>mr` |
| CMake tests | `<leader>mt` |

## Project structure

```text
nvim/
├── init.lua
└── lua/
    ├── config/
    │   ├── autocmds.lua
    │   ├── diagnostics.lua
    │   ├── health.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins/
        ├── completion.lua
        ├── debug.lua
        ├── editor.lua
        ├── formatting.lua
        ├── git.lua
        ├── lsp.lua
        ├── navigation.lua
        ├── project.lua
        ├── rust.lua
        ├── treesitter.lua
        └── ui.lua
```

## Health check

Run:

```vim
:checkhealth
```

The configuration also provides:

```vim
:lua require("config.health").check()
```

## License

MIT
