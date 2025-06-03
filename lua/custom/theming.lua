local function read_theme()
  local home = os.getenv 'HOME'
  local theme_file = io.open(home .. '/.config/nvim/theme', 'r')
  if not theme_file then
    print 'Could not open file'
    return
  end
  local theme = theme_file:read '*l'
  theme_file:close()
  return theme
end

local theme = read_theme()

if theme ~= nil then
  -- Global theme
  vim.cmd('colorscheme ' .. theme)

  -- Lualine theme
  require('lualine').setup {
    options = { theme = theme },
  }
else
  print 'Failed to open theme file'
end
