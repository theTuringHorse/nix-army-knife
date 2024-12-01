local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder() -- get clearer error messages
end

config.check_for_updates = false
config.font = wezterm.font 'Caskaydia Cove Nerd Font'
config.color_scheme = 'Kanagawa (Gogh)'
config.font_size = 20
config.adjust_window_size_when_changing_font_size = false

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95
config.tab_bar_at_bottom = true
config.initial_rows = 150
config.initial_cols= 150

 config.keys = {
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
}
config.window_padding = {
  left = 6,
  right = 2,
  top = 8,
  bottom = 0,
}

return config
