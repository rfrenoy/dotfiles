return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    { "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Git blame line" },
  },
}
