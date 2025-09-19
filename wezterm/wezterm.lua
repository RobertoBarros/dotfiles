-- ~/.config/wezterm/wezterm.lua
local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.tab_max_width = 999
-- Theme
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.98
config.colors = {
  cursor_bg = "#ffffff",
  cursor_fg = "#000000",
  cursor_border = "#ffffff",
  tab_bar = {
    active_tab = {
      bg_color = "#5817c1",
      fg_color = "#ffffff",
    },
  },
  active_pane = {
    bg_color = "#ff0000",
  },
}

-- Font
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 15.0
config.line_height = 1.08

-- Window / macOS
config.window_decorations = "RESIZE"
config.window_padding = { left = 35, right = 35, top = 15, bottom = 15 }
config.quit_when_all_windows_are_closed = true
config.window_close_confirmation = "NeverPrompt"
config.window_frame = {
  active_titlebar_bg = "#1e1e2e",
  inactive_titlebar_bg = "#1e1e2e",
}

-- Tabs
-- config.tab_bar_at_bottom = true
config.window_frame = {
  font_size = 16.0
}

-- Scrollback
config.scrollback_lines = 20000

-- Cursor
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0

-- Keys
config.keys = {
  { key = "RightArrow", mods = "CMD|OPT",   action = act.ActivateTabRelative(1) },
  { key = "LeftArrow",  mods = "CMD|OPT",   action = act.ActivateTabRelative(-1) },
  { key = "d",          mods = "CMD",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d",          mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
  { key = "LeftArrow",  mods = "SHIFT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "SHIFT", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "SHIFT", action = act.ActivatePaneDirection("Down") },
}


-- Highlight active pane by dimming inactive panes
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.4,
}

return config
