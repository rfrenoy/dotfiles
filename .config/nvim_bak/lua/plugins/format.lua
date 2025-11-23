return {
  {
    "stevearc/conform.nvim",
    lazy = true,
    opts = function(_, opts)
      -- Disable automatic formatting on save
      opts.format_on_save = nil
      opts.format_after_save = nil

      opts.formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        ruby = { "prettier" },
      }
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = opts.formatters.prettier or {}
      opts.formatters.prettier.condition = function()
        return true
      end
    end,
  },
}
