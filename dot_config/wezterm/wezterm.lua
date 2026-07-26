local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("MartianMono Nerd Font Mono")
config.font_size = 8
config.underline_position = -3

config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true

-- Unbind some default keybindings
config.keys = {
	{
		key = "n",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "h",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "k",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "f",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config
