KeyUp = function()
    hs.eventtap.keyStroke({}, 'up', 20000)
end

KeyDown = function()
    hs.eventtap.keyStroke({}, 'down', 20000)
end

KeyLeft = function()
    hs.eventtap.keyStroke({}, 'left', 20000)
end

KeyRight = function()
    hs.eventtap.keyStroke({}, 'right', 20000)
end

JumpLeft = function()
    hs.eventtap.keyStroke({'alt'}, 'left', 20000)
end

JumpRight = function()
    hs.eventtap.keyStroke({'alt'}, 'right', 20000)
end

SelectLeft = function()
    hs.eventtap.keyStroke({'shift'}, 'left', 20000)
end
SelectRight = function()
    hs.eventtap.keyStroke({'shift'}, 'right', 20000)
end
SelectUp = function()
    hs.eventtap.keyStroke({'shift'}, 'up', 20000)
end
SelectDown = function()
    hs.eventtap.keyStroke({'shift'}, 'down', 20000)
end

SJumpLeft = function()
    hs.eventtap.keyStroke({'alt', 'shift'}, 'left', 20000)
end
SJumpRight = function()
    hs.eventtap.keyStroke({'alt', 'shift'}, 'right', 20000)
end

ShiftBegin = function()
    hs.eventtap.keyStroke({'cmd', 'shift'}, 'left', 20000)
end
ShiftEnd = function()
    hs.eventtap.keyStroke({'cmd', 'shift'}, 'right', 20000)
end

Home = function()
    hs.eventtap.keyStroke({}, 'home', 20000)
end
End = function()
    hs.eventtap.keyStroke({}, 'end', 20000)
end

keyDelete = function()
    hs.eventtap.keyStroke({"ctrl"}, 'h', 20000)
    -- hs.eventtap.keyStroke({}, 'delete', 20000)
end
keyForwardDelete = function()
    hs.eventtap.keyStroke({}, 'forwarddelete', 20000)
end
deleteWholeLine = function()
    hs.eventtap.keyStroke({"cmd"}, 'left', 20000)
    hs.eventtap.keyStroke({"ctrl"}, 'k', 20000)
end

copy = function()
    hs.eventtap.keyStroke({"cmd"}, "c", 20000)
end
cut = function()
    hs.eventtap.keyStroke({"cmd"}, "x", 20000)
end
wrapLineCopy = function()
    hs.eventtap.keyStroke({"cmd"}, 'right', 20000)
    hs.eventtap.keyStroke({"cmd", "shift"}, 'left', 20000)
    hs.eventtap.keyStroke({"cmd"}, "c", 20000)
end
wrapLineCut = function()
    hs.eventtap.keyStroke({"cmd"}, 'right', 20000)
    hs.eventtap.keyStroke({"cmd", "shift"}, 'left', 20000)
    hs.eventtap.keyStroke({"cmd"}, "x", 20000)
end
paste = function()
    hs.eventtap.keyStroke({'cmd'}, 'v', 20000)
end
undo = function()
    hs.eventtap.keyStroke({'cmd'}, 'z', 20000)
end

NewLine = function()
    hs.eventtap.keyStroke({"cmd"}, 'return', 20000)
end

Enter = function()
    hs.eventtap.keyStroke({}, "return", 20000)
end

Alfred = function()
    hs.eventtap.keyStroke({'alt'}, "space", 20000)
end

previous_tab = function()
    hs.eventtap.keyStroke({'cmd', 'alt'}, 'left', 20000)
end

next_tab = function()
    hs.eventtap.keyStroke({'cmd', 'alt'}, 'right', 20000)
end

show_all_apps = function()
    hs.eventtap.keyStroke({'fn', 'ctrl'}, 'up', 20000)
end

show_all_windows = function()
    hs.eventtap.keyStroke({'fn', 'ctrl'}, 'down', 20000)
end

-- down = hs.hotkey.new({}, 'd', KeyDown, nil, KeyDown)
-- up = hs.hotkey.new({}, 'e', KeyUp, nil, KeyUp)
-- left = hs.hotkey.new({}, 's', KeyLeft, nil, KeyLeft)
-- right = hs.hotkey.new({}, 'f', KeyRight, nil, KeyRight)
-- jumpLeft = hs.hotkey.new({}, 'a', JumpLeft, nil, JumpLeft)
-- jumpRight = hs.hotkey.new({}, 'g', JumpRight, nil, JumpRight)

-- s_left = hs.hotkey.new({}, 'j', SelectLeft, nil, SelectLeft)
-- s_right = hs.hotkey.new({}, 'l', SelectRight, nil, SelectRight)
-- s_up = hs.hotkey.new({}, 'i', SelectUp, nil, SelectUp)
-- s_down = hs.hotkey.new({}, 'k', SelectDown, nil, SelectDown)

-- s_jumpLeft = hs.hotkey.new({}, 'h', SJumpLeft, nil, SJumpLeft)
-- s_jumpright = hs.hotkey.new({}, 'n', SJumpRight, nil, SJumpRight)

-- delete = hs.hotkey.new({}, 'w', keyDelete, nil ,keyDelete)
-- f_delete = hs.hotkey.new({}, 'r', keyForwardDelete, nil ,keyForwardDelete)
-- copy = hs.hotkey.new({}, 'c', copy, nil, copy)  -- dont work
-- paste = hs.hotkey.new({}, 'v', paste, nil, paste)  -- dont work
-- undo = hs.hotkey.new({}, 'z', undo, nil, undo)  -- dont work

-- s_begin = hs.hotkey.new({}, 'u', ShiftBegin, nil ,ShiftBegin)
-- s_end = hs.hotkey.new({}, 'o', ShiftEnd, nil ,ShiftEnd)

-- jumpStart = hs.hotkey.new({}, 'p', Home, nil ,Home)
-- jumpEnd = hs.hotkey.new({}, ';', End, nil ,End)

-- enter = hs.hotkey.new({}, 'space', Enter)
-- alfred = hs.hotkey.new({}, 'q', Alfred)

-- pre_tab = hs.hotkey.new({"alt"}, 's', previous_tab)
-- next_tab = hs.hotkey.new({"alt"}, 'f', next_tab)

capslock = require "modules/hotkey"
capslock.bind({}, 'd', KeyDown, nil, KeyDown)
capslock.bind({}, 'e', KeyUp, nil, KeyUp)
capslock.bind({}, 's', KeyLeft, nil, KeyLeft)
capslock.bind({}, 'f', KeyRight, nil, KeyRight)
capslock.bind({}, 'a', JumpLeft, nil, JumpLeft)
capslock.bind({}, 'g', JumpRight, nil, JumpRight)

capslock.bind({}, 'j', SelectLeft, nil, SelectLeft)
capslock.bind({}, 'l', SelectRight, nil, SelectRight)
capslock.bind({}, 'i', SelectUp, nil, SelectUp)
capslock.bind({}, 'k', SelectDown, nil, SelectDown)

capslock.bind({}, 'h', SJumpLeft, nil, SJumpLeft)
capslock.bind({}, 'n', SJumpRight, nil, SJumpRight)

capslock.bind({}, 'w', keyDelete, nil ,keyDelete)
capslock.bind({}, 'r', keyForwardDelete, nil ,keyForwardDelete)
capslock.bind({}, 'delete', deleteWholeLine, nil, deleteWholeLine)

capslock.bind({}, 'c', nil, copy, copy)
capslock.bind({"alt"}, 'c', nil, wrapLineCopy, wrapLineCopy)
capslock.bind({}, 'x', nil, cut, cut)
capslock.bind({"alt"}, 'x', nil, wrapLineCut, wrapLineCut)
capslock.bind({}, 'v', nil, paste, paste)
capslock.bind({}, 'z', nil, undo, undo)

capslock.bind({}, 'u', ShiftBegin, nil ,ShiftBegin)
capslock.bind({}, 'o', ShiftEnd, nil ,ShiftEnd)

capslock.bind({}, 'p', Home, nil ,Home)
capslock.bind({}, ';', End, nil ,End)

capslock.bind({}, 'space', Enter)
capslock.bind({}, 'return', nil, NewLine, NewLine)
capslock.bind({}, 'q', Alfred)

capslock.bind({"cmd"}, 's', previous_tab)
capslock.bind({"cmd"}, 'f', next_tab)

capslock.bind({}, 'up', show_all_apps)
capslock.bind({}, 'down', show_all_windows)

-- hs.hotkey.bind({'shift'}, 'x', function()
-- hs.eventtap.keyStroke({"cmd"}, "c", 20000)
-- end)

-- hs.hotkey.bind({}, 'c', copy, nil, nil)
-- capslock.bind({}, 'd', KeyDown, nil, KeyDown)
-- local test = hs.eventtap.event.newKeyEvent({}, "f19", false)

-- hs.hotkey.bind({}, "9", function()
-- print(test:getKeyCode())
-- end)

-- copy = hs.hotkey.bind({}, "x",
--   function()
--     -- print(hs.eventtap.checkKeyboardModifiers())
--     -- for _,each in pairs(hs.eventtap.checkKeyboardModifiers()) do  -- each is screen object
--     --     print(_)
--     -- end
--     if nil then
-- hs.eventtap.keyStroke({}, 'x', 20000)
--       -- toggle_application("Emacs")
--     else
--       -- copy:disable()
-- hs.eventtap.keyStroke({"cmd"}, "c", 20000)
--       -- hs.timer.doAfter(0.1, function()
--       --     copy:enable()
--       -- end)
--     end
--   end
-- )

