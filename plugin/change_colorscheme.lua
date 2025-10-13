local themes = {
  "handmade-hero",
  "fluoromachine",
  "zenbones",
  "nes"
}

local current = 0

local function cycle_black_metal_theme()
  current = current + 1
  if current > #themes then
    current = 1
  end

  local theme_name = themes[current]
  local command = ":colorscheme " .. theme_name
  vim.cmd(command)
  vim.notify("Colorscheme: " .. theme_name, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('ToggleTheme', function()
  local opt = vim.opt
  local bg = opt.background:get()
  if bg == "dark" then
    vim.cmd("set background=light")
  else
    vim.cmd("set background=dark")
  end
end, {})

vim.api.nvim_create_user_command("CycleBM", cycle_black_metal_theme, {})
