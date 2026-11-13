return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, {
            buffer = bufnr,
            desc = desc,
          })
        end

        map("<leader>gh", gs.preview_hunk, "Preview hunk")
        map("<leader>gs", gs.stage_hunk, "Stage hunk")
        map("<leader>gu", gs.undo_stage_hunk, "Unstage hunk")
        map("<leader>gr", gs.reset_hunk, "Reset hunk")
        map("]h", gs.next_hunk, "Next hunk")
        map("[h", gs.prev_hunk, "Previous hunk")
      end,
    },
  },
}
