local wezterm = require 'wezterm'
return {
	-- color_scheme = 'termnial.sexy',
	color_scheme = 'Catppuccin Mocha',
	enable_tab_bar = false,
	font_size = 15.0,
	font = wezterm.font('JetBrains Mono'),

	-- window_background_image = '/home/slauzon/Pictures/Wallpapers/gojo.png',
	window_background_image_hsb = {
	brightness = 0.1,
	hue = 1.0,
	saturation = 0.5,
	},
	window_frame = {
	  border_left_width = '0.2cell',
	  border_right_width = '0.2cell',
	  border_bottom_height = '0.1cell',
	  border_top_height = '0.1cell',
	  border_left_color = '#b4befe',
	  border_right_color = '#b4befe',
	  border_bottom_color = '#b4befe',
	  border_top_color = '#b4befe',
	},
	-- window_background_opacity = 0.92,
	-- window_background_opacity = 1.0,
	window_background_opacity = 0.9,
	-- window_background_opacity = 0.20,
	window_decorations = 'RESIZE',
	keys = {
		{
			key = 'f',
			mods = 'CTRL',
			action = wezterm.action.ToggleFullScreen,
		},
	},
	mouse_bindings = {
	  -- Ctrl-click will open the link under the mouse cursor
	  {
	    event = { Up = { streak = 1, button = 'Left' } },
	    mods = 'CTRL',
	    action = wezterm.action.OpenLinkAtMouseCursor,
	  },
	},
}
