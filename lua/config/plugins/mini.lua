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
    config = function()
      require("mini.indentscope").setup({})
    end
  },
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup({})
    end
  },
  {
    "echasnovski/mini.comment",
    lazy = false,
    version = false,
    config = function()
      require("mini.comment").setup({})
    end
  },
}
