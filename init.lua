require "modules/hotkey"
require "modules/fundamental"
require "modules/windows"
require "modules/screens"
require "modules/applications"
require "modules/auto_reload"
require "modules/path"
local mod = require "modules/clipboard"
mod:init()
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")


-- activate = function()
--     down:enable()
--     up:enable()
--     left:enable()
--     right:enable()
--     jumpLeft:enable()
--     jumpRight:enable()
--     s_left:enable()
--     s_right:enable()
--     s_up:enable()
--     s_down:enable()
--     s_jumpLeft:enable()
--     s_jumpright:enable()
--     delete:enable()
--     f_delete:enable()
--     copy:enable()
--     paste:enable()
--     undo:enable()
--     s_begin:enable()
--     s_end:enable()
--     jumpStart:enable()
--     jumpEnd:enable()
--     enter:enable()
--     alfred:enable()

--     left_half_window:enable()
--     right_half_window:enable()
--     hint_windows:enable()
--     show_grid_windows:enable()
--     up_windows:enable()
--     left_windows:enable()
--     right_windows:enable()
--     down_windows:enable()

--     for _, app in pairs(key2App_event) do
--         app:enable()
--     end

--     switch_mouse:enable()
--     pre_tab:enable()
--     next_tab:enable()
-- end

-- deactivate = function()
--     down:disable()
--     up:disable()
--     left:disable()
--     right:disable()
--     jumpLeft:disable()
--     jumpRight:disable()
--     s_left:disable()
--     s_right:disable()
--     s_up:disable()
--     s_down:disable()
--     s_jumpLeft:disable()
--     s_jumpright:disable()
--     delete:disable()
--     f_delete:disable()
--     copy:disable()
--     paste:disable()
--     undo:disable()
--     s_begin:disable()
--     s_end:disable()
--     jumpStart:disable()
--     jumpEnd:disable()
--     enter:disable()
--     alfred:disable()

--     left_half_window:disable()
--     right_half_window:disable()
--     hint_windows:disable()
--     show_grid_windows:disable()
--     up_windows:disable()
--     left_windows:disable()
--     right_windows:disable()
--     down_windows:disable()

--     for _, app in pairs(key2App_event) do
--         app:disable()
--     end

--     switch_mouse:disable()
--     pre_tab:disable()
--     next_tab:disable()
-- end

-- hs.hotkey.bind({}, 'f19', activate, deactivate)


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
