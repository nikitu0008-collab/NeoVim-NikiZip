return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      {
        "<leader>tt",
        "<cmd>ToggleTerm<CR>",
        desc = "Toggle terminal",
      },
    },
    opts = {
      direction = "float",
      float_opts = {
        border = "rounded",
      },
    },
  },

  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>mb", "<cmd>CMakeBuild<CR>", desc = "CMake build" },
      { "<leader>mr", "<cmd>CMakeRun<CR>", desc = "CMake run" },
      { "<leader>mt", "<cmd>CMakeRunTest<CR>", desc = "CMake tests" },
    },
    opts = {
      cmake_command = "cmake",
      ctest_command = "ctest",
      cmake_generate_options = {
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
      },
      cmake_build_directory = "out/${variant:buildType}",
    },
  },
}
