capslock = require "modules/hotkey"

capslock.bind({"cmd"}, "p", function()
    if hs.window.focusedWindow():application():title() == "Finder" then
        cur = hs.window.focusedWindow():application()
        -- print(cur:getMenuItems()))
        cur:selectMenuItem({"Finder", "Services", "Copy Path"})
    end
end)