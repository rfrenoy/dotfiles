return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      typescript = { "biome" },
      typescriptreact = { "biome" },
      javascript = { "biome" },
      javascriptreact = { "biome" },
      json = { "biome" },
    },
  },
}
