return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "fennel", "lua", "vim", "vimdoc", "query", "python", "go", "javascript", "html", "cpp" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  } }
