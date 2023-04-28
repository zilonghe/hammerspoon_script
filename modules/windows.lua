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
left_half_window = hs.hotkey.bind(capslock, '[', function() window.focusedWindow():moveToUnit(layout.left50) end)

-- Capslock ] for right one half window
right_half_window = hs.hotkey.bind(capslock, ']', function() window.focusedWindow():moveToUnit(layout.right50) end)

-- Capslock / to show window hints
hint_windows = hs.hotkey.bind(capslock, '/', hints.windowHints)

-- Hotkeys to interact with the window grid
show_grid_windows = hs.hotkey.bind(capslock, ',', grid.show)
up_windows = hs.hotkey.bind({"cmd","alt","shift"}, 'i', grid.pushWindowUp)
left_windows = hs.hotkey.bind({"cmd","alt","shift"}, 'j', grid.pushWindowLeft)
right_windows = hs.hotkey.bind({"cmd","alt","shift"}, 'l', grid.pushWindowRight)
down_windows = hs.hotkey.bind({"cmd","alt","shift"}, 'k', grid.pushWindowDown)
