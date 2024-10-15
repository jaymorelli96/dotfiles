-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_close_confirmation = "NeverPrompt"

config.default_prog = { "/bin/zsh" }

-- Appearance
local function color_scheme_by_theme(theme)
	if theme:find("Dark") then
		return "Nord (base16)"
	else
		return "Nord Light (Gogh)"
	end
end

config.window_background_opacity = 0.98

config.color_scheme = color_scheme_by_theme(wezterm.gui.get_appearance())
config.font = wezterm.font("BerkeleyMono Nerd Font Mono")
config.font_size = 14
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false

config.window_frame = {
	font = wezterm.font({ family = "BerkeleyMono Nerd Font Mono", weight = "Bold" }),
	font_size = 14.0,

	active_titlebar_bg = "#2e3440",
	inactive_titlebar_bg = "#2e3440",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#2e3440",
		background = "#2e3440",
		active_tab = {
			bg_color = "#2e3440",
			fg_color = "#88c0d0",
		},

		inactive_tab = {
			bg_color = "#2e3440",
			fg_color = "#5e81ac",
		},
		inactive_tab_hover = {
			bg_color = "#2e3440",
			fg_color = "#5e81ac",
		},

		new_tab = {
			bg_color = "#2e3440",
			fg_color = "#5e81ac",
		},
	},
}

-- and finally, return the configuration to wezterm
return config
