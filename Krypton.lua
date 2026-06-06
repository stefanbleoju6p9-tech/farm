local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- CONFIGURARE
_G.AutoKick = false
_G.AutoSpeed = false

-- GUI (Interfața)
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local MainFrame = Instance.new("Frame", ScreenGui); MainFrame.Size = UDim2.new(0, 200, 0, 150); MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75); MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30); MainFrame.Draggable = true

local function AddBtn(text, toggle)
    local btn = Instance.new("TextButton", MainFrame); btn.Size = UDim2.new(1, 0, 0, 40); btn.Text = text; btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.MouseButton1Click:Connect(function() 
        _G[toggle] = not _G[toggle]
        btn.Text = text .. ": " .. (_G[toggle] and "ON" or "OFF")
    end)
end

AddBtn("Auto Kick", "AutoKick")
AddBtn("Auto Buy Speed", "AutoSpeed")

-- LOGICĂ AUTO KICK
RunService.RenderStepped:Connect(function()
    if _G.AutoKick then
        -- Verifică dacă există un Lucky Block în fața ta sau aproape
        local args = { [1] = "Kick" } -- Comanda generică de kick
        game:GetService("ReplicatedStorage").Remotes.Kick:FireServer(unpack(args))
    end
    
    if _G.AutoSpeed then
        -- Cumpără viteză (trebuie să schimbi calea cu butonul din jocul tău)
        -- Exemplu: game:GetService("ReplicatedStorage").Remotes.BuySpeed:FireServer()
    end
end)