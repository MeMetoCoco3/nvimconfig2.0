return {
  --[[
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
    end
  },
  --]]
  {
    'echasnovski/mini.icons',
    lazy = false,
    config = function()
      require("mini.icons").setup({ style = "glyph" })
    end
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
  },
}
