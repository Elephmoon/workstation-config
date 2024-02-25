-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'Catppuccin Latte'
config.font = wezterm.font 'Fira Code'
config.font_size = 15
config.window_close_confirmation = 'NeverPrompt'
config.use_fancy_tab_bar = true

-- config.colors = {
  --foreground = '#383a42',
  --background = '#cccccc',
  --cursor_bg = '#383a42',
  --cursor_fg = '#cccccc',
  --tab_bar = {
    --background = '#cccccc',
  --}
--}

config.keys = {
  -- spawn new tab
  {
    key = 'n',
    mods = 'CMD|ALT',
    action = act.SpawnTab 'DefaultDomain',
  },
  -- close current tab
  {
    key = 'w',
    mods = 'CMD|ALT',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  -- rename current tab
  {
    key = 'r',
    mods = 'CMD|ALT',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  -- next left tab 
  { key = '[', mods = 'CMD|ALT', action = act.ActivateTabRelative(-1) },
  -- next right tab
  { key = ']', mods = 'CMD|ALT', action = act.ActivateTabRelative(1) },
}

for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD|ALT',
    action = act.ActivateTab(i - 1),
  })
end


wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
