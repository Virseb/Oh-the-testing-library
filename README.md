# A usless library for testing

```lua
local gg = loadstring(game:HttpGet("https://raw.githubusercontent.com/Virseb/Oh-the-testing-library/main/lib.lua"))()

local frameInfo = gg.make(true, 10)
local frame = frameInfo[2]

gg.button(frame, 10, function()
    print("Button clicked!")
end, "Button 1")

gg.button(frame, 10, function()
    print("Another button clicked!")
end, "Button 2")

gg.button(frame, 10, function()
    print("Third button clicked!")
end, "Button 3")

gg.button(frame, 10, function()
    print("Fourth button clicked!")
end, "Button 4")
```