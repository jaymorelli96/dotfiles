-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_close_confirmation = "NeverPrompt"

-- config.default_prog = { "/bin/zsh" }

-- Appearance
local function color_scheme_by_theme(theme)
	if theme:find("Dark") then
		return "Nord (base16)"
	else
		return "Nord Light (Gogh)"
	end
end

config.window_background_opacity = 0.98

-- config.color_scheme = color_scheme_by_theme(wezterm.gui.get_appearance())
config.color_scheme = "Nord (base16)"
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

config.keys = {
	{
		key = "a",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
	{
		key = "f",
		mods = "CMD",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "i",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "u",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.SpawnWindow,
	},
	{
		key = "p",
		mods = "CMD",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "CMD",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
}

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
-- you can put the rest of your Wezterm config here
smart_splits.apply_to_config(config, {
	-- directional keys to use in order of: left, down, up, right
	direction_keys = { "h", "j", "k", "l" },

	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "CMD", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
})

-- and finally, return the configuration to wezterm
return config
