return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    { "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Git blame line" },
    {
      "<leader>gO",
      function()
        local file = vim.fn.expand("%")
        local line = vim.fn.line(".")
        local blame_output = vim.fn.system(string.format("git blame -L %d,%d --porcelain %s", line, line, file))
        local sha = blame_output:match("^(%x+)")
        if sha and sha ~= string.rep("0", 40) then
          local remote = vim.fn.system("git remote get-url origin"):gsub("%s+$", "")
          local url = remote:gsub("git@github.com:", "https://github.com/"):gsub("%.git$", "")
          vim.ui.open(url .. "/commit/" .. sha)
        else
          vim.notify("No commit info for this line", vim.log.levels.WARN)
        end
      end,
      desc = "Open commit in browser",
    },
  },
}
