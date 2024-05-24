# A simple library for testing

```lua
local gg = loadstring(game:HttpGet("https://raw.githubusercontent.com/Virseb/Oh-the-testing-library/main/lib.lua"))()

local frameInfo = gg.make(true, 10) -- black,white ; corner radious
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

gg.createNavigationButtons(frame)
```
press *back* to go back as for the first time it shows blank, Creating more buttons will result in more pages being created wich can be shown using 'next'; 'back', buttons

# The fix.. using this code below can costumise the code even more

```
```

It helps so that when you execute it the first page isnt blank
