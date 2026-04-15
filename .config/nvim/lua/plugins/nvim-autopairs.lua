return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true, -- use treesitter to check for pairs (skips inside comments/strings)
    ts_config = {
      lua = { "string" },
      typescript = { "template_string" },
      typescriptreact = { "template_string" },
      javascript = { "template_string" },
    },
    fast_wrap = {
      map = "<M-e>", -- Alt+e to wrap with a pair (e.g. surround a word with parens)
    },
  },
}
