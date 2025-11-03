return { {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    disable_frontmatter = true,
    workspaces = {
      {
        name = "ed0bsidian",
        path = "~/work/ed0bsidian/",
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    templates = {
      folder = "4 ETCETERA/Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    mappings = {
      ["gf"] = {
        action = function()
          -- Get the text under cursor (the link)
          local link = require("obsidian").util.cursor_link()
          if link then
            -- Try to get the path to the note
            local path = require("obsidian").util.parse_link(link).path
            if path then
              -- Check if the note exists
              local note = require("obsidian").vault:note_by_path(path)
              if note and note:exists() then
                -- If it exists, navigate to it
                return require("obsidian").util.gf_passthrough()
              else
                -- If it doesn't exist, create it and navigate to it
                local new_note = require("obsidian").vault:new_note({
                  path = path,
                })
                vim.cmd("edit " .. new_note.path)
                return ""
              end
            end
          end
          -- If not in a link, use default gf behavior
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },
    notes_subdir = "0 NOTAS ATOMICAS",
    new_notes_location = "notes_subdir",
    note_path_func = function(spec)
      local path = spec.dir / spec.title
      return path:with_suffix(".md")
    end,
  },
} }
