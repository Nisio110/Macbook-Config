{
    "folke/tokyonight.nvim",
    lazy = false,     -- load immediately
    priority = 1000,  -- load before other plugins
    config = function()
      require("tokyonight").setup({
        style = "moon",  -- "storm", "moon", "night", or "day"
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        }
    })
}
