require("config.lazy")
-- OPTIONS
local set = vim.opt
set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"


-- KEYMAPS
local map = vim.keymap.set
map("n", "<space><space>x", "<cmd>source %<CR>")
map("n", "<space>x", ":.lua<CR>")
map("v", "<space>x", ":lua<CR>")
map("n", "-", ":e .<CR>")
map('n', 'grn', vim.lsp.buf.rename)
map('n', 'gra', vim.lsp.buf.code_action)
map('n', 'grr', vim.lsp.buf.references)
map(
  "n",
  "<Leader>rl",
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
  { desc = "Insert Raylib on Golang" }
)
-- AUTOCOMANDS
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text that is copied.",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- EXPERIMENTS
-- Source next line to see TreeShitter capabilities
-- vim.cmd[[hi @function.builtin.lua guifg=yellow]]
-- vim.cmd[[hi @function.builtin.lua guibg=black]]
