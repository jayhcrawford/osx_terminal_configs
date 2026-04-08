-- ~/.wezterm.lua
local wezterm = require 'wezterm'


local config = wezterm.config_builder()



wezterm.on('gui-startup', function(cmd)
  local mux = wezterm.mux

  -- First tab: nvim
  local tab1, pane1, window = mux.spawn_window(cmd or {})
  pane1:send_text('nvim\n')
  tab1:set_title("😊 nvim")   -- title + smiley face icon

  -- Second tab: pwsh
  local tab2, pane2 = window:spawn_tab({})
  pane2:send_text('pwsh\n')
  tab2:set_title("🎉 pwsh")   -- title + party popper icon
end)

-- the annoying window that always asks if I'm sure

return {
  window_close_confirmation = 'NeverPrompt',
  font_size = 18,
  initial_cols = 80, 
  initial_rows = 24,
  color_scheme = 'Aci (Gogh)'
}

