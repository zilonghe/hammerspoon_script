capslock = require "modules/hotkey"
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

hs.hotkey.bind(capslock, ".", switchMouse)
switch_mouse_by_mouse = hs.hotkey.bind({"ctrl"}, "0", switchMouse)