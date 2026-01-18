return {
  "lewis6991/hover.nvim",
  dependencies = { "lewis6991/gitsigns.nvim" },
  event = "LspAttach",
  config = function()
    require("hover").setup({
      init = function()
        require("hover.providers.lsp")
        require("hover.providers.diagnostic")
        require("hover.providers.man")
      end,
      preview_opts = {
        border = "rounded",
      },
      title = true,
    })
  end,
  keys = {
    { "K", function() require("hover").hover() end, desc = "Hover" },
    { "gK", function() require("hover").hover_select() end, desc = "Hover select" },
    { "<C-p>", function() require("hover").hover_switch("previous") end, desc = "Hover previous source" },
    { "<C-n>", function() require("hover").hover_switch("next") end, desc = "Hover next source" },
  },
}
