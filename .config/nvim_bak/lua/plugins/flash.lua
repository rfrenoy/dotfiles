return {
  "folke/flash.nvim",
  keys = {
    -- Disable default 's' mapping
    { "s", mode = { "n", "x", "o" }, false },
    -- Remap Flash to '/' in normal mode
    -- { "/", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
