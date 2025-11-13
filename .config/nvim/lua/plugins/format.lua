return {
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      opts.formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        ruby = { "prettier" },
      }
      opts.formatters.prettier.condition = function()
        return true
      end
    end,
  },
}
