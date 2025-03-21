return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = "Find help." })
      vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, { desc = "Find directory." })
      vim.keymap.set('n', '<space>fk', require("telescope.builtin").keymaps, { desc = "Find keymaps." })
      vim.keymap.set("n", "<space>en", function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = "Find nvim config." })

      vim.keymap.set("n", "<space>eo", function()
        require("telescope.builtin").find_files {
          cwd = "/home/evildead20/Documents/Projects/Obsidian/Vault69"
        }
      end, { desc = "Find obsidian notes." })


      -- Checks every file related to a plugin
      vim.keymap.set("n", "<space>ep", function()
        require("telescope.builtin").find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }
      end, { desc = "Find plugins." })

      -- Custom Plugin
      require "config.telescope.multigrep".setup()
    end
  }
}
