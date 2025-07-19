# My own config of NVIM
This is a vanila config of NVIM that Im making for learning porpuses using the TJ videos.

## What it has:
- Some usefull mapping, and commands written in the *init.lua* file.
- Use of *lazy package manager*.
- LSP for lua, python and go.
- LSP for fennel added.
- LSP for markdown (marksman) added.
- Treesitter.
- Status line from *mini.nvim*. UPDATED: Status line from lualine.nvim
- Cyberdream colorscheme.
- Added formating on save.
- Added Telescope.
- Added livegrep custom plugin.
- Added oil.
- Added autocompletion.
- Added Dashboard.
- Added Notify for search bar.
- Errors are shown with lsp-lines, disable that erros ALSO show with lsp-config.
- Added todo comments.
- Disable arrows.
- Added WhichKey.
- Added num.colorizer.
- Added mini.indentscope and mini.pairs.
- Added Treesitter-context.
- Added markdown renderer.
- Added obsidian folder link.
- Added obsidian plugin.
- Added Typr.
- Added Zenmode.
- Added BlackMetalNvim colorscheme + Swap keymaps for different colorschemes and light mode.
- Now I can hover over errors to get info.
- NeoTree.

## Thinking of adding:
-  Vim-OrgMode

#### Remarks:
- Config imported on windows: 
  Had the problem because *telescope-fzf* requires
  gcc to build the .dll of fzf, so I just used the
  compiler from Visual Studio to build it using
  this line
