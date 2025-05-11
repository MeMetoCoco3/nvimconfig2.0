local themes = {
  "windir",
  "darkthrone",
  "emperor",
  "khold",
  "immortal",
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
  vim.notify("Black Metal theme: " .. theme_name, vim.log.levels.INFO)
end


vim.api.nvim_create_user_command("CycleBM", cycle_black_metal_theme, {})
