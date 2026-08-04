--[[
Neverpuzo Hub | Murder Mystery 2 Auto Farm
]]

game:GetService("RunService").Heartbeat:Wait()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
if not player then
    Players:WaitForChild("LocalPlayer")
    player = Players.LocalPlayer
end

local function createUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NeverpuzoHub"
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 520, 0, 420)
    mainFrame.Position = UDim2.new(0.5, -260, 0.5, -210)
    mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 13)
    mainFrame.BackgroundTransparency = 0.05
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.fromRGB(78, 127, 252)
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui

    local shadow = Instance.new("UIStroke")
    shadow.Thickness = 6
    shadow.Transparency = 0.9
    shadow.Color = Color3.fromRGB(78, 127, 252)
    shadow.Parent = mainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame

    local leftMenu = Instance.new("Frame")
    leftMenu.Size = UDim2.new(0, 160, 1, 0)
    leftMenu.BackgroundTransparency = 1
    leftMenu.Parent = mainFrame

    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundTransparency = 1
    header.Parent = leftMenu

    local logo = Instance.new("ImageLabel")
    logo.Size = UDim2.new(0, 32, 0, 32)
    logo.Position = UDim2.new(0, 10, 0, 9)
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://120358385035996"
    logo.ImageColor3 = Color3.fromRGB(78, 127, 252)
    logo.Parent = header

    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(1, -50, 0, 20)
    titleText.Position = UDim2.new(0, 50, 0, 8)
    titleText.BackgroundTransparency = 1
    titleText.Text = "Neverpuzo"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.Font = Enum.Font.GothamBold
    titleText.TextSize = 18
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = header

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, -50, 0, 15)
    subtitle.Position = UDim2.new(0, 50, 0, 28)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Murder Mystery 2"
    subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    subtitle.TextTransparency = 0.65
    subtitle.Font = Enum.Font.GothamBold
    subtitle.TextSize = 9
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.Parent = header

    local headerLine = Instance.new("Frame")
    headerLine.Size = UDim2.new(1, -10, 0, 1)
    headerLine.Position = UDim2.new(0.5, 0, 1, 0)
    headerLine.AnchorPoint = Vector2.new(0.5, 1)
    headerLine.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
    headerLine.BackgroundTransparency = 0.65
    headerLine.Parent = header

    local tabScroller = Instance.new("ScrollingFrame")
    tabScroller.Size = UDim2.new(1, -10, 1, -120)
    tabScroller.Position = UDim2.new(0.5, 0, 0, 60)
    tabScroller.AnchorPoint = Vector2.new(0.5, 0)
    tabScroller.BackgroundTransparency = 1
    tabScroller.ScrollBarThickness = 0
    tabScroller.BorderSizePixel = 0
    tabScroller.Parent = leftMenu

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = tabScroller

    tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabScroller.CanvasSize = UDim2.fromOffset(0, tabLayout.AbsoluteContentSize.Y + 1)
    end)

    local bottomBar = Instance.new("Frame")
    bottomBar.Size = UDim2.new(1, 0, 0, 60)
    bottomBar.Position = UDim2.new(0, 0, 1, -60)
    bottomBar.BackgroundTransparency = 1
    bottomBar.Parent = leftMenu

    local userAvatar = Instance.new("ImageLabel")
    userAvatar.Size = UDim2.new(0, 35, 0, 35)
    userAvatar.Position = UDim2.new(0, 10, 0, 12)
    userAvatar.BackgroundTransparency = 1
    userAvatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    userAvatar.Parent = bottomBar

    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(1, 0)
    avatarCorner.Parent = userAvatar

    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Size = UDim2.new(1, -50, 0, 20)
    usernameLabel.Position = UDim2.new(0, 50, 0, 12)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.Text = player.DisplayName
    usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    usernameLabel.Font = Enum.Font.GothamBold
    usernameLabel.TextSize = 14
    usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    usernameLabel.TextTruncate = Enum.TextTruncate.SplitWord
    usernameLabel.Parent = bottomBar

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, -50, 0, 15)
    statusLabel.Position = UDim2.new(0, 50, 0, 32)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Premium"
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    statusLabel.TextTransparency = 0.65
    statusLabel.Font = Enum.Font.GothamBold
    statusLabel.TextSize = 10
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = bottomBar

    local bottomLine = Instance.new("Frame")
    bottomLine.Size = UDim2.new(1, -10, 0, 1)
    bottomLine.Position = UDim2.new(0.5, 0, 0, 0)
    bottomLine.AnchorPoint = Vector2.new(0.5, 0)
    bottomLine.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
    bottomLine.BackgroundTransparency = 0.65
    bottomLine.Parent = bottomBar

    local rightMenu = Instance.new("Frame")
    rightMenu.Size = UDim2.new(1, -160, 1, 0)
    rightMenu.Position = UDim2.new(0, 161, 0, 0)
    rightMenu.BackgroundColor3 = Color3.fromRGB(8, 8, 13)
    rightMenu.BackgroundTransparency = 0.6
    rightMenu.BorderSizePixel = 0
    rightMenu.ClipsDescendants = true
    rightMenu.Parent = mainFrame

    local rightCorner = Instance.new("UICorner")
    rightCorner.CornerRadius = UDim.new(0, 13)
    rightCorner.Parent = rightMenu

    local rightStroke = Instance.new("UIStroke")
    rightStroke.Transparency = 0.65
    rightStroke.Color = Color3.fromRGB(45, 48, 58)
    rightStroke.Parent = rightMenu

    local rightHeader = Instance.new("Frame")
    rightHeader.Size = UDim2.new(1, 0, 0, 50)
    rightHeader.BackgroundTransparency = 1
    rightHeader.Parent = rightMenu

    local headerLine2 = Instance.new("Frame")
    headerLine2.Size = UDim2.new(1, -10, 0, 1)
    headerLine2.Position = UDim2.new(0.5, 0, 1, 0)
    headerLine2.AnchorPoint = Vector2.new(0.5, 1)
    headerLine2.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
    headerLine2.BackgroundTransparency = 0.65
    headerLine2.Parent = rightHeader

    local tabContainer = Instance.new("Frame")
    tabContainer.Size = UDim2.new(1, 0, 1, -50)
    tabContainer.Position = UDim2.new(0, 0, 0, 50)
    tabContainer.BackgroundTransparency = 1
    tabContainer.ClipsDescendants = true
    tabContainer.Parent = rightMenu

    -- ============================
    -- TAB SYSTEM — FIXED
    -- Each tab captures its own index via an upvalue,
    -- not the shared tabIndex counter at call time.
    -- ============================

    local tabs = {}

    local function setActiveTab(index)
        for i, tab in ipairs(tabs) do
            tab.content.Visible = (i == index)
            tab.button.BackgroundTransparency = (i == index) and 0.5 or 1
            tab.button.TextTransparency = (i == index) and 0 or 0.5
        end
    end

    local function createTab(name)
        local myIndex = #tabs + 1  -- captured correctly per-tab

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -5, 0, 30)
        btn.Position = UDim2.new(0.5, 0, 0, 0)
        btn.AnchorPoint = Vector2.new(0.5, 0)
        btn.BackgroundColor3 = Color3.fromRGB(41, 45, 49)
        btn.BackgroundTransparency = 1
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextTransparency = 0.5
        btn.TextSize = 12
        btn.Font = Enum.Font.GothamMedium
        btn.BorderSizePixel = 0
        btn.Parent = tabScroller

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        local content = Instance.new("Frame")
        content.Size = UDim2.new(1, 0, 1, 0)
        content.BackgroundTransparency = 1
        content.Visible = false
        content.Parent = tabContainer

        tabs[myIndex] = { button = btn, content = content }

        btn.MouseButton1Click:Connect(function()
            setActiveTab(myIndex)
        end)

        -- Activate first tab immediately after it's registered
        if myIndex == 1 then
            content.Visible = true
            btn.BackgroundTransparency = 0.5
            btn.TextTransparency = 0
        end

        return content
    end

    local autoTab  = createTab("Auto Farm")
    local afkTab   = createTab("Anti-AFK")
    local stealTab = createTab("Anti-Steal")

    -- Helper
    local function createControl(parent, yPos, labelText, buttonText)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -20, 0, 30)
        frame.Position = UDim2.new(0, 10, 0, yPos)
        frame.BackgroundTransparency = 1
        frame.Parent = parent

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.45, -10, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = labelText
        label.TextColor3 = Color3.fromRGB(150, 150, 150)
        label.Font = Enum.Font.Gotham
        label.TextSize = 12
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.45, -10, 1, 0)
        btn.Position = UDim2.new(0.55, 5, 0, 0)
        btn.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
        btn.Text = buttonText
        btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 11
        btn.Parent = frame

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 4)
        btnCorner.Parent = btn

        return frame, label, btn
    end

    -- ============================
    -- TAB 1: AUTO FARM
    -- ============================

    local statusFrame = Instance.new("Frame")
    statusFrame.Size = UDim2.new(1, -20, 0, 35)
    statusFrame.Position = UDim2.new(0, 10, 0, 10)
    statusFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
    statusFrame.BackgroundTransparency = 0.5
    statusFrame.Parent = autoTab

    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 6)
    statusCorner.Parent = statusFrame

    local statusText = Instance.new("TextLabel")
    statusText.Size = UDim2.new(1, 0, 1, 0)
    statusText.BackgroundTransparency = 1
    statusText.Text = "Neverpuzo Hub | Murder Mystery 2"
    statusText.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusText.Font = Enum.Font.Gotham
    statusText.TextSize = 13
    statusText.Parent = statusFrame

    local statsFrame = Instance.new("Frame")
    statsFrame.Size = UDim2.new(1, -20, 0, 30)
    statsFrame.Position = UDim2.new(0, 10, 0, 55)
    statsFrame.BackgroundTransparency = 1
    statsFrame.Parent = autoTab

    local statsLabel = Instance.new("TextLabel")
    statsLabel.Size = UDim2.new(1, 0, 1, 0)
    statsLabel.BackgroundTransparency = 1
    statsLabel.Text = "Collected: 0 | Coins/Hour: 0"
    statsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    statsLabel.Font = Enum.Font.Gotham
    statsLabel.TextSize = 12
    statsLabel.Parent = statsFrame

    local farmBtn = Instance.new("TextButton")
    farmBtn.Size = UDim2.new(1, -20, 0, 40)
    farmBtn.Position = UDim2.new(0, 10, 0, 95)
    farmBtn.BackgroundColor3 = Color3.fromRGB(78, 127, 252)
    farmBtn.Text = "Start Farming"
    farmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    farmBtn.Font = Enum.Font.GothamBold
    farmBtn.TextSize = 14
    farmBtn.Parent = autoTab

    local farmCorner = Instance.new("UICorner")
    farmCorner.CornerRadius = UDim.new(0, 8)
    farmCorner.Parent = farmBtn

    local speedFrame, speedLabel, speedBtn = createControl(autoTab, 145, "Speed: 20", "Change Speed")
    local coinFrame, coinLabel, coinBtn    = createControl(autoTab, 180, "Coin Type: All", "Change Type")

    local collected = 0
    local startTime = 0
    local speed = 20
    local visited = {}
    local farming = false
    local coinType = "All"
    local coinTypes = {"All", "Coin"}
    local currentTypeIndex = 1

    farmBtn.MouseButton1Click:Connect(function()
        farming = not farming

        if farming then
            farmBtn.Text = "Stop Farming"
            farmBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            collected = 0
            startTime = tick()
            visited = {}

            task.spawn(function()
                while farming do
                    local elapsed = tick() - startTime
                    local rate = math.floor((collected / math.max(1, elapsed)) * 3600)
                    statsLabel.Text = string.format("Collected: %d | Coins/Hour: %d", collected, rate)
                    task.wait(1)
                end
            end)

            task.spawn(function()
                while farming do
                    pcall(function()
                        local char = player.Character
                        if not char or not char.Parent then
                            char = player.CharacterAdded:Wait()
                        end

                        local humPart = char:FindFirstChild("HumanoidRootPart")
                        if humPart then
                            local closest, dist = nil, math.huge

                            for _, obj in ipairs(workspace:GetDescendants()) do
                                if obj:IsA("BasePart") and obj.Name == "Coin_Server" and not visited[obj] then
                                    local shouldCollect = coinType == "All"
                                        or (coinType == "Coin" and (obj:GetAttribute("CoinID") or "") == "Coin")

                                    if shouldCollect then
                                        local d = (obj.Position - humPart.Position).Magnitude
                                        if d < dist and d <= 250 then
                                            closest, dist = obj, d
                                        end
                                    end
                                end
                            end

                            if closest and closest.Parent then
                                visited[closest] = true
                                local tween = TweenService:Create(
                                    humPart,
                                    TweenInfo.new(dist / speed, Enum.EasingStyle.Linear),
                                    { CFrame = CFrame.new(closest.Position) }
                                )
                                tween:Play()
                                tween.Completed:Wait()
                                collected += 1
                            end
                        end
                    end)
                    task.wait(0.3)
                end
            end)
        else
            farmBtn.Text = "Start Farming"
            farmBtn.BackgroundColor3 = Color3.fromRGB(78, 127, 252)
        end
    end)

    speedBtn.MouseButton1Click:Connect(function()
        local speedInput = Instance.new("TextBox")
        speedInput.Size = UDim2.new(0, 120, 0, 30)
        speedInput.Position = UDim2.new(0.5, -60, 0.5, -15)
        speedInput.BackgroundColor3 = Color3.fromRGB(30, 32, 40)
        speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedInput.Font = Enum.Font.Gotham
        speedInput.TextSize = 14
        speedInput.PlaceholderText = "Speed (5-50)"
        speedInput.Parent = autoTab

        local inputCorner = Instance.new("UICorner")
        inputCorner.CornerRadius = UDim.new(0, 6)
        inputCorner.Parent = speedInput

        speedInput:CaptureFocus()
        speedInput.FocusLost:Connect(function()
            local num = tonumber(speedInput.Text)
            if num then
                speed = math.clamp(num, 5, 50)
                speedLabel.Text = "Speed: " .. speed
            end
            speedInput:Destroy()
        end)
    end)

    coinBtn.MouseButton1Click:Connect(function()
        currentTypeIndex = currentTypeIndex % #coinTypes + 1
        coinType = coinTypes[currentTypeIndex]
        coinLabel.Text = "Coin Type: " .. coinType
        visited = {}

        statsLabel.Text = "Changed to: " .. coinType
        task.wait(1.5)

        if farming then
            local elapsed = tick() - startTime
            local rate = math.floor((collected / math.max(1, elapsed)) * 3600)
            statsLabel.Text = string.format("Collected: %d | Coins/Hour: %d", collected, rate)
        else
            statsLabel.Text = "Collected: 0 | Coins/Hour: 0"
        end
    end)

    -- ============================
    -- TAB 2: ANTI-AFK
    -- ============================

    local afkStatusFrame = Instance.new("Frame")
    afkStatusFrame.Size = UDim2.new(1, -20, 0, 70)
    afkStatusFrame.Position = UDim2.new(0, 10, 0, 10)
    afkStatusFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
    afkStatusFrame.BackgroundTransparency = 0.5
    afkStatusFrame.Parent = afkTab

    local afkStatusCorner = Instance.new("UICorner")
    afkStatusCorner.CornerRadius = UDim.new(0, 6)
    afkStatusCorner.Parent = afkStatusFrame

    local afkStatusLabel = Instance.new("TextLabel")
    afkStatusLabel.Size = UDim2.new(1, 0, 1, 0)
    afkStatusLabel.BackgroundTransparency = 1
    afkStatusLabel.Text = "Anti-AFK\nPrevents you from being kicked for inactivity"
    afkStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    afkStatusLabel.Font = Enum.Font.Gotham
    afkStatusLabel.TextSize = 13
    afkStatusLabel.TextWrapped = true
    afkStatusLabel.Parent = afkStatusFrame

    local afkBtn = Instance.new("TextButton")
    afkBtn.Size = UDim2.new(1, -20, 0, 40)
    afkBtn.Position = UDim2.new(0, 10, 0, 95)
    afkBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    afkBtn.Text = "Anti-AFK (OFF)"
    afkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    afkBtn.Font = Enum.Font.GothamBold
    afkBtn.TextSize = 14
    afkBtn.Parent = afkTab

    local afkBtnCorner = Instance.new("UICorner")
    afkBtnCorner.CornerRadius = UDim.new(0, 8)
    afkBtnCorner.Parent = afkBtn

    local antiAfkActive = false

    afkBtn.MouseButton1Click:Connect(function()
        antiAfkActive = not antiAfkActive

        if antiAfkActive then
            afkBtn.Text = "Anti-AFK (ON)"
            afkBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
            afkStatusLabel.Text = "Anti-AFK is ACTIVE\nYou won't be kicked for being idle!"

            task.spawn(function()
                while antiAfkActive do
                    pcall(function()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end)
                    task.wait(15)
                end
            end)
        else
            afkBtn.Text = "Anti-AFK (OFF)"
            afkBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            afkStatusLabel.Text = "Anti-AFK\nPrevents you from being kicked for inactivity"
        end
    end)

    -- ============================
    -- TAB 3: ANTI-STEAL
    -- ============================

    local stealStatusFrame = Instance.new("Frame")
    stealStatusFrame.Size = UDim2.new(1, -20, 0, 70)
    stealStatusFrame.Position = UDim2.new(0, 10, 0, 10)
    stealStatusFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
    stealStatusFrame.BackgroundTransparency = 0.5
    stealStatusFrame.Parent = stealTab

    local stealStatusCorner = Instance.new("UICorner")
    stealStatusCorner.CornerRadius = UDim.new(0, 6)
    stealStatusCorner.Parent = stealStatusFrame

    local stealStatusLabel = Instance.new("TextLabel")
    stealStatusLabel.Size = UDim2.new(1, 0, 1, 0)
    stealStatusLabel.BackgroundTransparency = 1
    stealStatusLabel.Text = "Anti-Steal\nProtects your items from being stolen"
    stealStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    stealStatusLabel.Font = Enum.Font.Gotham
    stealStatusLabel.TextSize = 13
    stealStatusLabel.TextWrapped = true
    stealStatusLabel.Parent = stealStatusFrame

    local stealBtn = Instance.new("TextButton")
    stealBtn.Size = UDim2.new(1, -20, 0, 40)
    stealBtn.Position = UDim2.new(0, 10, 0, 95)
    stealBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    stealBtn.Text = "Anti-Steal (OFF)"
    stealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    stealBtn.Font = Enum.Font.GothamBold
    stealBtn.TextSize = 14
    stealBtn.Parent = stealTab

    local stealBtnCorner = Instance.new("UICorner")
    stealBtnCorner.CornerRadius = UDim.new(0, 8)
    stealBtnCorner.Parent = stealBtn

    local antiStealActive = false
    local oldNamecall

    stealBtn.MouseButton1Click:Connect(function()
        antiStealActive = not antiStealActive

        if antiStealActive then
            stealBtn.Text = "Anti-Steal (ON)"
            stealBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
            stealStatusLabel.Text = "Anti-Steal is ACTIVE\nYour items are protected!"

            if hookmetamethod then
                oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                    local method = getnamecallmethod()
                    if method == "FireServer" then
                        local name = tostring(self.Name)
                        if name == "SendRequest" or name == "AcceptTrade" or name == "OfferItem" then
                            return nil
                        end
                    end
                    return oldNamecall and oldNamecall(self, ...)
                end)
            end
        else
            stealBtn.Text = "Anti-Steal (OFF)"
            stealBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            stealStatusLabel.Text = "Anti-Steal\nProtects your items from being stolen"
        end
    end)

    -- ============================
    -- DRAGGABLE WINDOW
    -- ============================

    local drag = false
    local dragStart = nil
    local startPos = nil

    local function attachDrag(handle)
        handle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                drag = true
                dragStart = input.Position
                startPos = mainFrame.Position
            end
        end)
        handle.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                drag = false
            end
        end)
    end

    local dragHandle = Instance.new("Frame")
    dragHandle.Size = UDim2.new(1, 0, 0, 50)
    dragHandle.BackgroundTransparency = 1
    dragHandle.Parent = rightHeader
    attachDrag(dragHandle)

    local leftDragHandle = Instance.new("Frame")
    leftDragHandle.Size = UDim2.new(1, 0, 0, 50)
    leftDragHandle.BackgroundTransparency = 1
    leftDragHandle.Parent = header
    attachDrag(leftDragHandle)

    UserInputService.InputChanged:Connect(function(input)
        if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    return screenGui
end

local success, err = pcall(createUI)
if not success then
    warn("Failed to create UI: " .. err)
else
    print("Neverpuzo Hub loaded successfully!")
end
