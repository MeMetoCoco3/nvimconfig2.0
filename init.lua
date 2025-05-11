require("config.lazy")


-- OPTIONS
local set = vim.opt
set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"

-- KEYMAPS
local map = vim.keymap.set

map("n", "<space>N", "añ<esc>", { desc = "Appends 'ñ'." })
map("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Runs file." })
map("n", "<space>x", ":.lua<CR>", { desc = "Runs line." })
map("v", "<space>x", ":lua<CR>", { desc = "Runs lines." })
map("n", "-", ":e .<CR>", { desc = "Open Oil." })
map('n', 'grn', vim.lsp.buf.rename, { desc = "Rename." })
map('n', 'gra', vim.lsp.buf.code_action, { desc = "." })
map('n', 'grr', vim.lsp.buf.references, { desc = "References." })
map('n', 'gd', vim.lsp.buf.definition, { desc = "Go definition." })
map(
  "n",
  "<space>rl",
  [[gg $<CR>i
    import (
      rl "github.com/gen2brain/raylib-go/raylib"
    )

    const (
      SCREENWIDTH = 600
      SCREENHEIGHT
    )

    func main(){
      rl.InitWindow(SCREENWIDTH, SCREENHEIGHT, "Snake")

      defer rl.CloseWindow()
      rl.SetTargetFPS(60)
    }<Esc>
    ]],
  { desc = "Insert Raylib on Golang." }
)
map("t", "<esc>", "<c-\\><c-n>", { desc = "Escape terminal mode." })
map({ "n", "t" }, "<space>tt", ":Floaterminal<CR>", { desc = "Toggle floating terminal." })
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map("n", "<space>ng", ":Neogit<CR>", { desc = "Opens Neogit." })

map("n", "<space>ob", ":ObsidianBacklinks<CR>", { desc = "Shows current note backlinks." })
map("n", "<space>ot", ":ObsidianTemplate<CR>", { desc = "Opens template menu." })

map("n", "<space>TT", ":Typr<CR>", { desc = "Open Typing tool." })
map("n", "<space>TS", ":TyprStats<CR>", { desc = "Open Typr stats." })
map("n", "<space>ZM", ":ZenMode<CR>", { desc = "Open Typr stats." })


map("n", "<Up>", "<Nop>", { noremap = true, silent = true })
map("n", "<Down>", "<Nop>", { noremap = true, silent = true })
map("n", "<Left>", "<Nop>", { noremap = true, silent = true })
map("n", "<Right>", "<Nop>", { noremap = true, silent = true })
map("i", "<Up>", "<Nop>", { noremap = true, silent = true })
map("i", "<Down>", "<Nop>", { noremap = true, silent = true })
map("i", "<Left>", "<Nop>", { noremap = true, silent = true })
map("i", "<Right>", "<Nop>", { noremap = true, silent = true })

map("n", "<space>oo", function()
  vim.cmd("cd ~/obsidian_vault/Vault69")
  require("telescope.builtin").find_files {
    cwd = "~/obsidian_vault/Vault69"
  }
end, { desc = "Open Obsidian vault." })

map("n", "<space>bm", ":CycleBM<CR>", { desc = "Cycle Black Metal Theme" })


vim.diagnostic.config({
  virtual_text = false
})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]



-- AUTOCOMANDS
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text that is copied.",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
--[[
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 100
    vim.opt_local.wrapmargin = 10

    vim.opt_local.foldcolumn = "10"
    vim.opt_local.number = false
    vim.opt_local.numberwidth = 6
  end
})
]]

-- OTHER CONFIGURATIONS
-- Disable errors from lsp-config being drawn
vim.diagnostic.config({
  virtual_text = false,
})

-- Used for rendering some icons on markdown.
vim.cmd(":set conceallevel=1")
vim.cmd(":colorscheme khold")
-- Used to tell colorizer that our terminal emulator can render true colors.
vim.opt.termguicolors = true

-- EXPERIMENTS
-- Source next line to see TreeShitter capabilities
-- vim.cmd[[hi @function.builtin.lua guifg=yellow]]
-- vim.cmd[[hi @function.builtin.lua guibg=black]]
vim.cmd [[
  " In your init.lua or syntax file
  syntax match BoldText /\*\*.\{-}\*\*/
  highlight BoldText gui=bold
]]




vim.api.nvim_create_user_command("BlackMetalThemes", function()
  local themes = require("black-metal.themes")
  print("Available black-metal themes:")
  for name, _ in pairs(themes) do
    print("- " .. name)
  end
end, {})
