-- watch for changes
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

local Capslock = {'alt'}
local Capslock_shift = {'alt', 'shift'}

--set menubar item
-- local caffeine = hs.menubar.new()
-- function setCaffeineDisplay(state)
--     if state then
--         caffeine:setTitle("AWAKE")
--     else
--         caffeine:setTitle("SLEEPY")
--     end
-- end

-- function caffeineClicked()
--     setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end

-- if caffeine then
--     caffeine:setClickCallback(caffeineClicked)
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
-- end

----appwatcher----
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Finder") then
            -- Bring all Finder windows forward when one gets activated
            appObject:selectMenuItem({"Window", "Bring All to Front"})
        end
    end
end
local appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

---draw on screen----
local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end
hs.hotkey.bind({"cmd","alt","shift"}, "D", mouseHighlight)

----move my mouse to another screen----
--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

function switchMouse()  -- next step to switch the foucs windows too.
    local current_screen = hs.window.focusedWindow():screen()  -- screen object
    mousepoint = hs.mouse.getAbsolutePosition()
    -- for _,each in pairs(hs.screen.allScreens()) do  -- each is screen object
    --     if each ~= current_screen then
    --         -- hs.mouse.setAbsolutePosition(hs.window.focusedWindow():frame().center)
    --         hs.mouse.setAbsolutePosition(each:frame().center)  -- each:frame() is geometry object
    --     end
    -- end
    hs.mouse.setAbsolutePosition(current_screen:next():frame().center)
    next_foucs_screen = hs.mouse.getCurrentScreen()  -- screen
    local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, next_foucs_screen))
    local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
    windowToFocus:focus()
end
hs.hotkey.bind(Capslock, ".", switchMouse)

-- RAMEN TIMER --

--Schedule a notification in 3 minutes.
function startRamenTimer()
  hs.timer.doAfter(5, function ()
    hs.notify.new({
        title="Ramen time!",
        informativeText="Your ramen is ready!"
    }):send()
  end)
  hs.alert(" Ramen timer started! ")
end

--Bind timer to `hammerspoon://ramentime`:
hs.urlevent.bind("ramentime", startRamenTimer)

-- END RAMEN TIMER --

KeyUp = function()
hs.eventtap.keyStroke({}, 'up')
end

KeyDown = function()
hs.eventtap.keyStroke({}, 'down')
end

KeyLeft = function()
hs.eventtap.keyStroke({}, 'left')
end

KeyRight = function()
hs.eventtap.keyStroke({}, 'right')
end

JumpLeft = function()
hs.eventtap.keyStroke({'alt'}, 'left')
end

JumpRight = function()
hs.eventtap.keyStroke({'alt'}, 'right')
end

SelectLeft = function()
hs.eventtap.keyStroke({'shift'}, 'left')
end
SelectRight = function()
hs.eventtap.keyStroke({'shift'}, 'right')
end
SelectUp = function()
hs.eventtap.keyStroke({'shift'}, 'up')
end
SelectDown = function()
hs.eventtap.keyStroke({'shift'}, 'down')
end

SJumpLeft = function()
hs.eventtap.keyStroke({'alt', 'shift'}, 'left')
end
SJumpRight = function()
hs.eventtap.keyStroke({'alt', 'shift'}, 'right')
end

keyDelete = function()
hs.eventtap.keyStroke({}, 'delete')
end
keyForwardDelete = function()
hs.eventtap.keyStroke({}, 'forwarddelete')
end
copy = function()
hs.eventtap.keyStroke({'cmd'}, 'c')
end
paste = function()
hs.eventtap.keyStroke({'cmd'}, 'v')
end
undo = function()
hs.eventtap.keyStroke({'cmd'}, 'z')
end


ShiftBegin = function()
hs.eventtap.keyStroke({'cmd', 'shift'}, 'left')
end
ShiftEnd = function()
hs.eventtap.keyStroke({'cmd', 'shift'}, 'right')
end

Home = function()
hs.eventtap.keyStroke({}, 'home')
end
End = function()
hs.eventtap.keyStroke({}, 'end')
end

hs.hotkey.bind(Capslock_shift, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

hs.hotkey.bind(Capslock, 'e', KeyUp, nil, KeyUp)
hs.hotkey.bind(Capslock, 'd', KeyDown, nil, KeyDown)
hs.hotkey.bind(Capslock, 's', KeyLeft, nil, KeyLeft)
hs.hotkey.bind(Capslock, 'f', KeyRight, nil, KeyRight)
hs.hotkey.bind(Capslock, 'a', JumpLeft, nil, JumpLeft)
hs.hotkey.bind(Capslock, 'g', JumpRight, nil, JumpRight)

hs.hotkey.bind(Capslock, 'j', SelectLeft, nil, SelectLeft)
hs.hotkey.bind(Capslock, 'l', SelectRight, nil, SelectRight)
hs.hotkey.bind(Capslock, 'i', SelectUp, nil, SelectUp)
hs.hotkey.bind(Capslock, 'k', SelectDown, nil, SelectDown)

hs.hotkey.bind(Capslock, 'h', SJumpLeft, nil, SJumpLeft)
hs.hotkey.bind(Capslock, 'n', SJumpRight, nil, SJumpRight)

hs.hotkey.bind(Capslock, 'w', keyDelete, nil ,keyDelete)
hs.hotkey.bind(Capslock, 'r', keyForwardDelete, nil ,keyForwardDelete)
hs.hotkey.bind(Capslock, 'C', copy, nil, nil)  -- dont work
hs.hotkey.bind(Capslock, 'V', paste, nil, nil)  -- dont work
hs.hotkey.bind(Capslock, 'Z', undo, nil, nil)  -- dont work

hs.hotkey.bind(Capslock, 'u', ShiftBegin, nil ,ShiftBegin)
hs.hotkey.bind(Capslock, 'o', ShiftEnd, nil ,ShiftEnd)

hs.hotkey.bind(Capslock, 'p', Home, nil ,Home)
hs.hotkey.bind(Capslock, ';', End, nil ,End)

-- hs.hotkey.bind(Capslock, "=", function()
-- print(package.path)
-- end
-- )

---app lanucher---
local key2App = {
'Finder',
'Google Chrome',
'iTerm',
'Sublime Text'
}

for index, app in pairs(key2App) do
    hs.hotkey.bind(Capslock, tostring(index), function()
        hs.application.launchOrFocus(app)
    end)
end

-- hs.hotkey.bind(Capslock, 'up', function()
--     hs.grid.maximizeWindow() 
-- end)

-- -- hyper + shift + left move the current window to the left monitor
-- hs.hotkey.bind(Capslock_shift, 'left', function() 
--     local w = hs.window.focusedWindow()
--     if not w then 
--         return
--     end
--     local s = w:screen():toWest()
--     if s then
--         w:moveToScreen(s)
--     end
-- end)

-- -- hyper + shift + right move the current window to the right monitor
-- hs.hotkey.bind(Capslock_shift, 'right', function() 
--     local w = hs.window.focusedWindow()
--     if not w then 
--         return
--     end
--     local s = w:screen():toEast()
--     if s then
--         w:moveToScreen(s)
--     end
-- end)

-- hs.hotkey.bind(Capslock_shift, 'h', function() 
--     hs.hints.windowHints(getAllValidWindows()) 
-- end)

-- function getAllValidWindows ()
--     local allWindows = hs.window.allWindows()
--     local windows = {}
--     local index = 1
--     for i = 1, #allWindows do
--         local w = allWindows[i]
--         if w:screen() then
--             windows[index] = w
--             index = index + 1
--         end
--     end
--     return windows
-- end


------------
require "hs.application"
local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local layout = require 'hs.layout'
local alert = require 'hs.alert'
local hints = require 'hs.hints'
local grid = require 'hs.grid'
local geometry = require 'hs.geometry'

---- Capslock [ for left one half window
hotkey.bind(Capslock, '[', function() window.focusedWindow():moveToUnit(layout.left50) end)

-- Capslock ] for right one half window
hotkey.bind(Capslock, ']', function() window.focusedWindow():moveToUnit(layout.right50) end)

-- Capslock / to show window hints
hotkey.bind(Capslock, '/', hints.windowHints)

-- Hotkeys to interact with the window grid
hotkey.bind(Capslock, ',', grid.show)
hotkey.bind('cmd', 'up', grid.pushWindowUp)
hotkey.bind('cmd', 'Left', grid.pushWindowLeft)
hotkey.bind('cmd', 'Right', grid.pushWindowRight)
hotkey.bind('cmd', 'Down', grid.pushWindowDown)

