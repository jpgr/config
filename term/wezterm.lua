local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- config.color_scheme = 'nord'

local colors = wezterm.color.get_default_colors()
colors.background = '#242933'
colors.foreground = '#BBBDAF'
colors.selection_fg = '#000000'
colors.selection_bg = '#F0DFAF'
colors.cursor_fg = '#000000'
colors.cursor_bg = '#F0DFAF'

colors.ansi = {
  '#191C1D',
  '#BD6062',
  '#A3D6A9',
  '#F0DFAF',
  '#8FB4D8',
  '#C7A9D9',
  '#B6D7A8',
  '#BDC5BD',
}
colors.brights = {
  '#727C7C',
  '#D18FAF',
  '#B7CEB0',
  '#BCBCBC',
  '#E0CF9F',
  '#C7A9D9',
  '#BBDA97',
  '#BDC5BD',
}

config.color_schemes = {
  ['default'] = colors,
}
config.color_scheme = 'default'


config.font = wezterm.font('JetBrainsMonoNL Nerd Font', { weight = 'Light' })

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- tab bar

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  tab_bar = {
    inactive_tab_edge = '#333333',
    active_tab = {
      bg_color = '#242933',
      fg_color = '#F0DFAF',
    },
    inactive_tab = {
      bg_color = '#191C1D',
      fg_color = '#BBBDAF',
    },
  },
}

config.window_frame = {
  font = wezterm.font('JetBrainsMonoNL Nerd Font', { weight = 'Light' }),
  font_size = 10.0,
  active_titlebar_bg = '#191C1D',
  inactive_titlebar_bg = '#191C1D',
}


return config
