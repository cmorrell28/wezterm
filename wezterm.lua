-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

-- Remap keys
config.keys = {
  -- See ASCII table for combined characters to determine which hex value to send (see https://www.physics.udel.edu/~watson/scen103/ascii.html)
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word (see https://github.com/wez/wezterm/issues/253)
  {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
  -- Make Option-Right equivalent to Alt-f; forward-word
  {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  -- Make Cmd-Left equivalent to Ctrl-a (start of line)
  {key="LeftArrow", mods="CMD", action=wezterm.action{SendString="\x01"}},
  -- Make Cmd-Right equivalent to Ctrl-e (end of line)
  {key="RightArrow", mods="CMD", action=wezterm.action{SendString="\x05"}},
  -- Make Cmd-Backspace equivalent to Ctrl-u (delete line)
  {key="Backspace", mods="CMD", action=wezterm.action{SendString="\x15"}}
}

-- and finally, return the configuration to wezterm
return config
