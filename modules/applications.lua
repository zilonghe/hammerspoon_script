--appwatcher----
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


---app lanucher---
key2App = {
'Finder',
'Google Chrome',
'iTerm2',
'Sublime Text'
}
capslock = require "modules/hotkey"

function bind_key_to_app()
    for index, app in pairs(key2App) do
        -- if app == 'iTerm2'
        capslock.bind({}, tostring(index), function()
            app_obj = hs.appfinder.appFromName(app)
            if (app_obj:isFrontmost()) then
                app_obj:hide()
            elseif (app == "iTerm2") then
                hs.application.launchOrFocus("iTerm")
            elseif (app == "Code") then
                hs.application.launchOrFocus("Visual Studio Code")
            else
                hs.application.launchOrFocus(app)            
            end
        end)
    end
end

for i=1,5 do
    capslock.bind({"cmd"}, tostring(i), function()
        current_app_name = hs.window.focusedWindow():application():title()
        print(current_app_name)
        key2App[i] = current_app_name
        bind_key_to_app()
    end)
end
bind_key_to_app()