-- For extra information about which lsp to use for which language check lspconfig-all
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()


      require 'lspconfig'.marksman.setup {
        capabilities = capabilities,
      }

      -- require 'lspconfig'.fennel_ls.setup {
      --   capabilities = capabilities,
      -- }
      --

      require 'lspconfig'.ccls.setup {
        capabilities = capabilities,
      }

      require 'lspconfig'.basedpyright.setup {
        capabilities = capabilities,
      }

      require 'lspconfig'.lua_ls.setup {
        capabilities = capabilities,
      }
      require('lspconfig').ols.setup({
        -- Optional: Add any specific configuration here
        cmd = { 'ols' }, -- Make sure 'ols' is in your PATH, or provide full path
        filetypes = { 'odin' },
        root_dir = require('lspconfig').util.root_pattern('ols.json', '.git'),
        single_file_support = true,
      })

      require 'lspconfig'.gopls.setup {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              composites = false,
            }
          }
        },
      }


      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end


          -- in future probably add if vim.bo.filetype == "py"/"go" use black or gofmt
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
