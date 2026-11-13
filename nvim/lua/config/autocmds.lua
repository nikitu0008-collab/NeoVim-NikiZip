local group = vim.api.nvim_create_augroup("NikiZip", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = "*.lua",
  callback = function(args)
    if vim.bo[args.buf].filetype == "lua" then
      vim.notify("Lua configuration saved", vim.log.levels.DEBUG)
    end
  end,
})
