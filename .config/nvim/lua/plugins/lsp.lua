return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      sorbet = {
        mason = false,
        filetypes = { "ruby" }, -- Only activate for Ruby files
        cmd = {
          "srb",
          "typecheck",
          "--lsp",
          "--disable-watchman",
          "--enable-experimental-lsp-signature-help",
          "--enable-experimental-requires-ancestor",
        },
      },
    },
  },
}
