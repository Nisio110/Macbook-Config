-- File: /Users/Oisin/.config/nvim/lua/plugins/tokyonight.lua

-- This file should return a table.
-- If it's a single plugin, it should be a list of one plugin:
return {
  { -- This is the table defining the 'tokyonight.nvim' plugin
    "folke/tokyonight.nvim",
    lazy = false, -- load immediately
    priority = 1000, -- load before other plugins
    config = function()
      -- This is the configuration function for tokyonight
      require("tokyonight").setup({
        style = "storm", -- "storm", "moon", "night", or "day" (you have "day" in the image, which is fine)
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
      })
    end, -- end of the config function
  }, -- end of the tokyonight plugin definition table
} -- end of the table returned by this file
