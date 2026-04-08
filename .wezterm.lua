local wezterm = require 'wezterm'

local config = wezterm.config_builder()

wezterm.on('gui-startup', function(cmd)
  local mux = wezterm.mux

  local tab1, pane1, window = mux.spawn_window(cmd or {})
  pane1:send_text('nvim\n')
  tab1:set_title("😊 nvim")

  local tab2, pane2 = window:spawn_tab({})
  pane2:send_text('pwsh\n')
  tab2:set_title("🎉 pwsh")
end)

-- assign values TO config
config.font_size = 18
config.initial_cols = 80
config.initial_rows = 24
config.color_scheme = 'Aci (Gogh)'

return config
