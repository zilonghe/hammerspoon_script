require "hs.application"
local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local layout = require 'hs.layout'
local alert = require 'hs.alert'
local hints = require 'hs.hints'
local grid = require 'hs.grid'
local geometry = require 'hs.geometry'
capslock = require "modules/hotkey"
---- Capslock [ for left one half window
left_half_window = capslock.bind({}, '[', function() window.focusedWindow():moveToUnit(layout.left50) end)

-- Capslock ] for right one half window
right_half_window = capslock.bind({}, ']', function() window.focusedWindow():moveToUnit(layout.right50) end)

-- Capslock / to show window hints
hint_windows = capslock.bind({}, '/', hints.windowHints)

-- Hotkeys to interact with the window grid
show_grid_windows = capslock.bind({}, ',', grid.show)
up_windows = capslock.bind("cmd", 'i', grid.pushWindowUp)
left_windows = capslock.bind("cmd", 'j', grid.pushWindowLeft)
right_windows = capslock.bind("cmd", 'l', grid.pushWindowRight)
down_windows = capslock.bind("cmd", 'k', grid.pushWindowDown)
