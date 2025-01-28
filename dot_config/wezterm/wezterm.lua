local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("MartianMono Nerd Font Mono")
config.font_size = 9

config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true

config.default_domain = "WSL:Ubuntu-22.04"

return config
