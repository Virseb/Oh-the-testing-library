local gg = {}
local buttonCount = 0

function gg.make(iswhite, size)
  local function createFrame(color)
    local gui = Instance.new("ScreenGui")
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    gui.Name = "FrameTest"
    
    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Name = "Main.Frame"
    frame.BackgroundColor3 = color
    frame.Size = UDim2.new(0, 200, 0, 300)  
    frame.Position = UDim2.new(0.5, -100, 0.5, -150)  
    frame.Active=true frame.Selectable = true frame.Draggable = true
    local folder = Instance.new("Folder")
    folder.Parent = frame
    folder.Name = "FrameHolder"
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.Parent = frame
    uiCorner.CornerRadius = UDim.new(0, tonumber(size))
    
    return {gui, frame, folder}
  end
  
  if iswhite then
    return createFrame(Color3.fromRGB(255, 255, 255))
  else
    return createFrame(Color3.fromRGB(0, 0, 0))
  end
end

function gg.button(frame, size, func, name)
  buttonCount = buttonCount + 1
  
  local button = Instance.new("TextButton")
  button.Parent = frame
  button.Size = UDim2.new(1, -20, 0, 50)  
  button.Position = UDim2.new(0, 10, 0, (buttonCount - 1) * 60 + 10)
  button.Text = tostring(name)
  button.TextColor3 = Color3.new(1, 1, 1)
  button.Font = Enum.Font.SourceSansBold
  
  local uiCorner = Instance.new("UICorner")
  uiCorner.Parent = button
  uiCorner.CornerRadius = UDim.new(0, tonumber(size))
  
  button.BackgroundColor3 = Color3.fromRGB(165, 137, 102)
  button.BorderColor3 = Color3.new(1, 1, 1)
  button.BorderSizePixel = 1
  
  button.MouseButton1Click:Connect(func)
  
  return button
end

return gg
