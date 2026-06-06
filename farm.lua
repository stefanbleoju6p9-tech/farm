local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")

-- 1. Monitorizare Chat (Exemplu pentru jocuri cu sistem de donații în chat)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data)
    local message = data.Message
    local speaker = data.FromSpeaker
    
    -- Verifică dacă mesajul conține "donated" și o sumă mare
    -- Atenție: Aceasta trebuie adaptată la formatul exact al chat-ului din jocul tău!
    if string.find(message, "donated") then
        local amount = string.match(message, "%d+") -- Extrage numărul
        if tonumber(amount) and tonumber(amount) >= 10000 then
            
            -- 2. Interfață întrebare
            print("Jucătorul " .. speaker .. " a donat " .. amount .. ". Vrei să te teleportezi la el?")
            
            -- Aici ai apela o funcție care afișează un GUI de "DA/NU"
            -- Dacă jucătorul apasă DA, execuți teleportarea:
            -- TeleportService:TeleportToPlaceInstance(game.PlaceId, "JOB_ID_GASIT", Players.LocalPlayer)
        end
    end
end)