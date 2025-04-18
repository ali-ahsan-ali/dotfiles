-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.font = wezterm.font("JetBrains Mono")

function SCHEME_FOR_APPEARANCE(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

local action = wezterm.action
config.keys = {
	{ mods = "CTRL", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "CTRL", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "u" }) },
}
config.color_scheme = SCHEME_FOR_APPEARANCE(wezterm.gui.get_appearance())
-- and finally, return the configuration to wezterm
return config
