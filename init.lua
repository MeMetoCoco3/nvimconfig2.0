print"FrancoFrancoFrancoFranco, porque digo Franco"


require("config.lazy")

-- OPTIONS
local set = vim.opt
set.shiftwidth = 4
set.number = true
set.clipboard = "unnamedplus"

-- KEYMAPS
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)

-- AUTOCOMANDS
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text that is copied.",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true}),
    callback = function()
    	vim.highlight.on_yank()
    end,
})

-- EXPERIMENTS
-- Source next line to see TreeShitter capabilities
-- vim.cmd[[hi @function.builtin.lua guifg=yellow]]
-- vim.cmd[[hi @function.builtin.lua guibg=black]]
