return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
    lazy = true,
    ft = { "ruby" }, -- Only load for Ruby files
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function()
              return vim.tbl_flatten({
                "bundle",
                "exec",
                "rspec",
              })
            end,
          }),
        },
      })
    end,
    keys = {
      { "<leader>t", "", desc = "+test" },
      {
        "<leader>ta",
        function()
          require("neotest").run.attach()
        end,
        desc = "Attach to Test (Neotest)",
      },
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File (Neotest)",
      },
      {
        "<leader>tT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Test Files (Neotest)",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest (Neotest)",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last (Neotest)",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary (Neotest)",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Show Output (Neotest)",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel (Neotest)",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop (Neotest)",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Toggle Watch (Neotest)",
      },
      {
        "<leader>ts",
        function()
          if vim.bo.filetype ~= "ruby" then
            return
          end

          local file = vim.fn.expand("%:p")
          local alternate_file

          if file:match("_spec%.rb$") then
            -- We're in a spec file, go to implementation
            -- Remove _spec.rb suffix first
            alternate_file = file:gsub("_spec%.rb$", ".rb")
            -- Replace /spec/ with /app/ (handles spec/models, spec/lib, etc.)
            alternate_file = alternate_file:gsub("/spec/", "/app/", 1)
          else
            -- We're in an implementation file, go to spec
            -- Handle different Rails directories
            if file:match("/app/") then
              alternate_file = file:gsub("/app/", "/spec/", 1):gsub("%.rb$", "_spec.rb")
            elseif file:match("/lib/") then
              alternate_file = file:gsub("/lib/", "/spec/lib/", 1):gsub("%.rb$", "_spec.rb")
            else
              -- Fallback: just add spec/ prefix and _spec suffix
              local filename = vim.fn.fnamemodify(file, ":t:r")
              local root = vim.fn.getcwd()
              alternate_file = root .. "/spec/" .. filename .. "_spec.rb"
            end
          end

          -- Check if the file exists
          if vim.fn.filereadable(alternate_file) == 1 then
            vim.cmd("edit " .. vim.fn.fnameescape(alternate_file))
          else
            -- File doesn't exist, ask if user wants to create it
            local response = vim.fn.confirm("File doesn't exist: " .. alternate_file .. "\nCreate it?", "&Yes\n&No", 2)
            if response == 1 then
              -- Create directory if it doesn't exist
              local dir = vim.fn.fnamemodify(alternate_file, ":h")
              vim.fn.mkdir(dir, "p")
              vim.cmd("edit " .. vim.fn.fnameescape(alternate_file))
            end
          end
        end,
        desc = "Toggle Spec File",
      },
    },
  },
}
