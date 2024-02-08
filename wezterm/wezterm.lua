local wezterm = require 'wezterm'
local act = wezterm.action

local config = {
  color_scheme = 'Tokyo Night',
  font = wezterm.font("JetBrainsMono NF"),
  use_ime = true,
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  disable_default_key_bindings = true,
}

config.keys = {
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
  { key = 'j', mods = 'CTRL|ALT', action = act.MoveTabRelative(-1) },
  { key = 'k', mods = 'CTRL|ALT', action = act.MoveTabRelative(1) },
  { key = 't', mods = 'CTRL|SHIFT', action = act.SpawnTab "CurrentPaneDomain" },
  { key = 'q', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = false } },

  { key = 'h', mods = 'ALT|SUPER', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'ALT|SUPER', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'ALT|SUPER', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'ALT|SUPER', action = act.ActivatePaneDirection 'Right' },
  { key = 'h', mods = 'ALT|SUPER|SHIFT', action = act.RotatePanes 'CounterClockwise' },
  { key = 'l', mods = 'ALT|SUPER|SHIFT', action = act.RotatePanes 'Clockwise' },
  { key = 'h', mods = 'ALT|SUPER|CTRL', action = act.AdjustPaneSize { 'Left', 6 } },
  { key = 'j', mods = 'ALT|SUPER|CTRL', action = act.AdjustPaneSize { 'Down', 6 } },
  { key = 'k', mods = 'ALT|SUPER|CTRL', action = act.AdjustPaneSize { 'Up', 6 } },
  { key = 'l', mods = 'ALT|SUPER|CTRL', action = act.AdjustPaneSize { 'Right', 6 } },
  { key = 'v', mods = 'ALT|SUPER', action = act.SplitHorizontal },
  { key = 's', mods = 'ALT|SUPER', action = act.SplitVertical },
  { key = 'q', mods = 'ALT|SUPER', action = act.CloseCurrentPane { confirm = false } },

  { key = 'u', mods = 'CTRL|SHIFT', action = act.ScrollByPage(-0.5) },
  { key = 'd', mods = 'CTRL|SHIFT', action = act.ScrollByPage(0.5) },
  { key = 'p', mods = 'CTRL|SHIFT', action = act.ScrollToPrompt(-1) },
  { key = 'n', mods = 'CTRL|SHIFT', action = act.ScrollToPrompt(1) },

  { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },

  { key = 's', mods = 'CTRL|SHIFT', action = act.QuickSelect },
  { key = 'f', mods = 'CTRL|SHIFT', action = act.Search { CaseSensitiveString = "" } },
  { key = 'x', mods = 'CTRL|SHIFT', action = act.ActivateCopyMode },
}

return config
