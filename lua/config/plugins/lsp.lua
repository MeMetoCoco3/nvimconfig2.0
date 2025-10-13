
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

      local lspconfig = require('lspconfig')
      local util = lspconfig.util
      lspconfig.marksman.setup {
        capabilities = capabilities,
      }

      lspconfig.nushell.setup({
        capabilities = capabilities,
        cmd = { 'nu', '--lsp' },
        filetypes = { 'nu' },
        root_dir = function(fname)
          return vim.fs.root(fname, { ".git" }) or vim.fs.dirname(fname)
        end,

        single_file_support = true,
      })


      lspconfig.ccls.setup {
        capabilities = capabilities,
        cmd = { "ccls" },
        filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern('compile_commands.json', '.ccls', '.git')(fname)
            or vim.fn.getcwd()
        end,
        init_options = {
          cache = {
            directory = ".ccls-cache";
          },
        },
      }


      --
      -- lspconfig.ccls.setup {
      --   cmd = { 'ccls', '--lsp' },
      --   capabilities = capabilities,
      --   filetypes = { "c", "h"},
      -- }
      --
      -- lspconfig.basedpyright.setup {
      --   capabilities = capabilities,
      -- }
      --
      -- lspconfig.lua_ls.setup {
      --   capabilities = capabilities,
      -- }
      --

      lspconfig.ols.setup({
        capabilities = capabilities,
        cmd = { "ols" },
        filetypes = { "odin" },
        root_dir = function(fname)
          -- first try ols.json or .git
          local root = util.root_pattern("ols.json", ".git")(fname)
          if root then
            return root
          end

          -- then try directory of file
          local dirname = vim.fs.dirname(fname)
          if dirname then
            return dirname
          end

          -- finally check $HOME/odinconfig if it exists
          local home_odin = vim.fn.expand("$HOME/misc")

          if vim.uv.fs_stat(home_odin) then
            return home_odin
          end

          return nil
        end,
        single_file_support = true,
      })


      -- lspconfig.ols.setup({
      --   cmd = { 'ols' },
      --   filetypes = { 'odin' },
      --   root_dir = function(fname)
      --     return require('lspconfig').util.root_pattern('ols.json', '.git')(fname)
      --         or require('lspconfig').vim.fs.dirname(fname)
      --   end,
      --   single_file_support = true,
      -- })
      --
      lspconfig.gopls.setup {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              composites = false,
            }
          }
        },
      }

      --
      -- vim.api.nvim_create_autocmd("LspAttach", {
      --   callback = function(args)
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     if not client then return end
      --
      --
      --     -- in future probably add if vim.bo.filetype == "py"/"go" use black or gofmt
      --     if client.supports_method("textDocument/formatting") then
      --       vim.api.nvim_create_autocmd("BufWritePre", {
      --         buffer = args.buf,
      --         callback = function()
      --           vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
      --         end,
      --       })
      --     end
      --   end,
      -- })
    end,
  }
}
