return {
  {
    "ficcdaf/ashen.nvim",
    -- optional but recommended,
    -- pin to the latest stable release:
    tag = "*",
    lazy = false,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },

  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },


  {
    'maxmx03/fluoromachine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require 'fluoromachine'

      fm.setup {
        glow = true,
        theme = 'fluoromachine',
        transparent = true,
      }

      vim.cmd.colorscheme 'fluoromachine'
    end
  }, {
  "rose-pine/neovim",
  name = "rose-pine"
},
  {
    "vague2k/vague.nvim",
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
    end
  },
  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        theme = "windir",
        variant = "dark",
        code_style = {
          comments = "italic",
          conditionals = "none",
          functions = "none",
          keywords = "none",
          headings = "bold", -- Markdown headings
          operators = "none",
          keyword_return = "none",
          strings = "none",
          variables = "none",
        },
      })
      require("black-metal").load()
    end,
  }
}
