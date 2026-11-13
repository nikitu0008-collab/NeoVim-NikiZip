local M = {}

function M.check()
  vim.health.start("NeoVim-NikiZip")

  vim.health.info("Neovim version: " .. vim.version().major .. "." .. vim.version().minor)

  for _, executable in ipairs({ "git", "rg", "cmake" }) do
    if vim.fn.executable(executable) == 1 then
      vim.health.ok(executable .. " is available")
    else
      vim.health.warn(executable .. " is not available in PATH")
    end
  end

  if vim.fn.has("win32") == 1 then
    vim.health.info("Windows detected")
  end
end

return M
