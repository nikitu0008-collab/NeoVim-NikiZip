return {
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
}
