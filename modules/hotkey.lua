capslock = {}

function capslock.bind(mod, key, pressedfn, releasedfn, repeatfn)
    _target = hs.hotkey.new(mod, key, pressedfn, releasedfn, repeatfn)
    table.insert(capslock, _target)

    hs.hotkey.bind({}, '{"ctrl","alt","shift"}', 
        function()
            for _, _func in pairs(capslock) do
                _func:enable()
            end
        end,
        function()
            for _, _func in pairs(capslock) do
                _func:disable()
            end
        end)
end

return capslock
