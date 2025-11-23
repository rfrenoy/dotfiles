return {
  "nvim-telescope/telescope.nvim",
  -- change some options
  opts = {
    defaults = {
      file_ignore_patterns = {
        ".git/",
        "node_modules/",
        ".cache/",
        ".venv/",
        "vendor/",
        "db/migrate/",
        "sorbet/",
        "package%-lock.json",
        "yarn.lock",
        "spec/vcr/",
        "spec/support/",
      },
    },
  },
}
