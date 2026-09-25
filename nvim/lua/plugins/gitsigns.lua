return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map("n", "<leader>gh", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
        map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Unstage hunk" })
        map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
        map("n", "]h", gs.next_hunk, { desc = "Next hunk" })
        map("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })
      end,
    },
  },
}