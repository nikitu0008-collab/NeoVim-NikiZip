-- ~/.config/nvim/lua/plugins.lua
return {
  {
  'saghen/blink.nvim',
  -- Включите, если хотите использовать последнюю версию
  version = 'v0.*',
  -- Если вы хотите использовать стабильную версию, уберите version и используйте build:
  build = 'cargo build --release',
  opts = {
    -- Ваши настройки blink.nvim здесь
    keymap = { preset = 'default' },
  },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- используйте config = function() require("nvim-autopairs").setup {} end
    -- если нужны специфичные настройки
  },
    -- 4. Плагин файлового дерева
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
      },
      mappings = {
            ["<cr>"] = "open_tabnew", -- Теперь Enter открывает файл в новой вкладке
            ["v"] = "open_vertical",   -- Добавляем свою клавишу для вертикального сплита
            ["h"] = "open_horizontal", -- И для горизонтального
      },
      config = function()
          require("neo-tree").setup({
              filesystem = {
                  use_web_devicons = true -- Эта опция включает иконки
              }
          })
      end
  },

  -- 3. Плагин статусной строки
  {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
          require("lualine").setup({
              options = {
                  theme = "catppuccin"
              }
          })
      end
  },


  -- Тема иконок
  {
    'echasnovski/mini.icons',
    opts = {},
    lazy = true,
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },

  -- Тема Catppuccin Mocha
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Менеджер LSP серверов (Mason)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Автоматическая настройка mason-lspconfig (упрощённо)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" }, -- установит clangd автоматически
        automatic_installation = true,
      })
    end,
  },

-- Расширения для clangd (Inlay Hints)
{
  "p00f/clangd_extensions.nvim",
  config = function()
    require("clangd_extensions").setup({
      inlay_hints = {
        inline = vim.fn.has("nvim-0.10") == 1,
        show_parameter_hints = true,
        parameter_hints_prefix = "← ",
        other_hints_prefix = "→ ",
        only_current_line = false,
        highlight = "Comment",
      },
    })
  end,
},

-- Настройка LSP клиентов (nvim-lspconfig)
{
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    local lspconfig = require("lspconfig")
    -- Ключевая настройка: передаём флаг --enable-config
    lspconfig.clangd.setup({
      cmd = { "clangd", "--enable-config" },
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      on_attach = function(client, bufnr)
        -- Отключаем автоформатирование, если не нужно
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- Настройка горячих клавиш для диагностики
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

        -- Переход между диагностиками
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      end,
    })
    -- Автокоманды при подключении LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
      end,
    })
  end,
},
 -- Автодополнение (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  -- Подсветка синтаксиса (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },

  -- Поиск файлов (Telescope)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },

    -- Визуальные отступы (indent-blankline)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = { indent = { char = "▏" } },
  },

  -- Плавная прокрутка (neoscroll)
  {
    "karb94/neoscroll.nvim",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      easing = "linear",
    },
  },

  -- Подсветка и навигация по TODO/FIXME
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- plenary уже есть в ваших зависимостях
    opts = { signs = true },
  },

  -- Стартовый экран (dashboard)
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
        header = {
            [[ _   _ _ _    _ ______       ]],
            [[| \ | (_) | _(_)__  (_)_ __  ]],
            [[|  \| | | |/ / | / /| | '_ \ ]],
            [[| |\  | |   <| |/ /_| | |_) |]],
            [[|_| \_|_|_|\_\_/____|_| .__/ ]],
            [[                      |_|    ]],
        },
          center = {
            { icon = "  ", desc = "Find File", key = "f", action = "Telescope find_files" },
            { icon = "  ", desc = "New File", key = "n", action = "ene" },
            { icon = "  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
            { icon = "  ", desc = "Quit", key = "q", action = "qa" },
          },
          footer = { "Neovim — мой инструмент выбора" },
        },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- нужно установить этот плагин (если ещё нет)
  },

  -- Интеграция CMake (cmake-tools)
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      cmake_command = "cmake",
      ctest_command = "ctest",
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_build_directory = "out/${variant:buildType}",
      cmake_compile_commands_options = {
        action = "soft_link",
        target = vim.loop.cwd(),
      },
    },
  },
  "folke/which-key.nvim",
  event = "VeryLazy", -- Плагин загрузится сразу после старта для быстрой работы
  opts = {
    -- Здесь можно оставить пусто, чтобы использовать настройки по умолчанию
    preset = "classic", -- Доступные варианты: "classic", "modern", "helix"
    delay = 300, -- Задержка в мс перед появлением окна (0.3 сек)
    spec = {
      -- Здесь можно группировать ваши клавиши, например:
      { "<leader>f", group = "file" },
      { "<leader>g", group = "git" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
