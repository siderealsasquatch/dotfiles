local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("DankMono Nerd Font Mono")
config.font_size = 10
config.underline_position = -3

config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true

return config
