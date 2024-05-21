local gg = {}
local buttonCount = 0
local currentPage = 1
local maxButtonsPerPage = 4

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
        frame.Active=true 
        frame.Selectable = true 
        frame.Draggable = true
        
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
    
    if (buttonCount - 1) % maxButtonsPerPage == 0 then
        currentPage = currentPage + 1
    end
    
    local button = Instance.new("TextButton")
    button.Name = "Button" .. buttonCount
    button.Parent = frame.FrameHolder
    button.Size = UDim2.new(1, -20, 0, 50)  
    button.Position = UDim2.new(0, 10, 0, ((buttonCount - 1) % maxButtonsPerPage) * 60 + 10)
    button.Text = tostring(name)
    button.TextScaled = true
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSansBold
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.Parent = button
    uiCorner.CornerRadius = UDim.new(0, tonumber(size))
    
    button.BackgroundColor3 = Color3.fromRGB(165, 137, 102)
    button.BorderColor3 = Color3.new(1, 1, 1)
    button.BorderSizePixel = 1
    
    button.MouseButton1Click:Connect(func)
    
    gg.updateButtonsVisibility(frame)
    
    return button
end

function gg.createNavigationButtons(frame)
    local nextButton = Instance.new("TextButton")
    nextButton.Parent = frame
    nextButton.Size = UDim2.new(0, 80, 0, 30)
    nextButton.Position = UDim2.new(1, -90, 1, -40)
    nextButton.Text = "Next"
    nextButton.TextColor3 = Color3.new(1, 1, 1)
    nextButton.BackgroundColor3 = Color3.fromRGB(165, 137, 102)
    nextButton.BorderSizePixel = 1
    nextButton.Font = Enum.Font.SourceSansBold
    nextButton.MouseButton1Click:Connect(function()
        currentPage = currentPage + 1
        gg.updateButtonsVisibility(frame)
    end)
    
    local prevButton = Instance.new("TextButton")
    prevButton.Parent = frame
    prevButton.Size = UDim2.new(0, 80, 0, 30)
    prevButton.Position = UDim2.new(0, 10, 1, -40)
    prevButton.Text = "Previous"
    prevButton.TextColor3 = Color3.new(1, 1, 1)
    prevButton.BackgroundColor3 = Color3.fromRGB(165, 137, 102)
    prevButton.BorderSizePixel = 1
    prevButton.Font = Enum.Font.SourceSansBold
    prevButton.MouseButton1Click:Connect(function()
        currentPage = currentPage - 1
        gg.updateButtonsVisibility(frame)
    end)
end

function gg.updateButtonsVisibility(frame)
    for _, child in ipairs(frame.FrameHolder:GetChildren()) do
        if child:IsA("TextButton") then
            child.Visible = false
        end
    end
    
    local startIndex = (currentPage - 1) * maxButtonsPerPage + 1
    local endIndex = math.min(startIndex + maxButtonsPerPage - 1, buttonCount)
    
    for i = startIndex, endIndex do
        local button = frame.FrameHolder:FindFirstChild("Button" .. i)
        if button then
            button.Visible = true
        end
    end
end

return gg
