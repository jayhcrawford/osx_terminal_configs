local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local is_windows = wezterm.target_triple:find("windows") ~= nil

wezterm.on('gui-startup', function(cmd)
  local mux = wezterm.mux

  local tab1, pane1, window

  if is_windows then
    tab1, pane1, window = mux.spawn_window({
      args = { "nvim" },
    })
  else
    tab1, pane1, window = mux.spawn_window(cmd or {})
    pane1:send_text('nvim\n')
  end

  tab1:set_title("😊 nvim")

  -------------------------------------------------
  -- TAB 2 (pwsh)
  -------------------------------------------------
  local tab2, pane2

  if is_windows then
    tab2, pane2 = window:spawn_tab({
      args = { "pwsh.exe" },
    })
  else
    tab2, pane2 = window:spawn_tab({})
    pane2:send_text('pwsh\n')
  end

  tab2:set_title("🎉 pwsh")

-------------------------------------------------
-- TAB 3 (PROJECT LAYOUT)
-------------------------------------------------


local pwsh = is_windows
  and { "pwsh.exe" }
  or { "/usr/local/bin/pwsh" }

-------------------------------------------------
-- TAB (project)
-------------------------------------------------
local tab3, root = window:spawn_tab({
  args = pwsh,
})
tab3:set_title("🚀 project")

-------------------------------------------------
-- Split into top/bottom (both pwsh)
-------------------------------------------------
local bottom = root:split({
  direction = "Bottom",
  size = 0.3,
  args = pwsh,
})


end)

-- assign values TO config
local target = wezterm.target_triple
if target:find("windows") then
  config.font_size = 12   -- smaller on Windows
  config.initial_cols = 170
  config.initial_rows = 40
else
  config.font_size = 18   -- larger on macOS/Linux
  config.initial_cols = 80
  config.initial_rows = 24
end

config.window_close_confirmation = 'NeverPrompt'

config.color_scheme = 'Aci (Gogh)'

local wezterm = require("wezterm")

return config
