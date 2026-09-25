return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        tools = {
          auto_autosave = true,
        },
        server = {
          default_settings = {
            ['rust-analyzer'] = {
              check = { command = "clippy" },
            },
          },
        },
      }
    end,
  }
}