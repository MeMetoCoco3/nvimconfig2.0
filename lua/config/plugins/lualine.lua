return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("lualine").setup {
        options = {
          theme = "cyberdream",
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          icons_enabled = true,
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'filename' },
          lualine_z = { { "datetime", style = "%H:%M" } }
        },
      }
    end,
  }
}
