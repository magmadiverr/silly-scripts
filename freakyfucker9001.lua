-- you can use any part of this script without credit! just dont rip the whole thing pls
-- credit to https://github.com/AZYsGithub/Arceus-X-UI-Library/blob/main/README.md for the ui library

game:GetService("StarterGui"):SetCore("SendNotification",{Title = "made with <3 by magmadiverr",Text = "",})
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Arceus-X-UI-Library/main/source.lua"))()
lib:SetTitle("freakyfucker 9001")
lib:SetIcon("http://www.roblox.com/asset/?id=0")
lib:SetBackgroundColor(7, 15, 43)
lib:SetCloseBtnColor(83, 92, 145)
lib:SetTitleColor(255, 255, 255)
lib:SetButtonsColor(27, 26, 85)

local egg = "Basic Egg"
local amount = 1

-- toggle for the auto clicker, spams the click remote
lib:AddToggle("autoclicker", function(state)
    _G.ac = state
    while _G.ac do
        game:GetService("ReplicatedStorage").Remotes.Clicker:FireServer()
        wait()
    end
end, false)

-- toggle for the auto rebirth, spams the rebirth remote with a wider delay to prevent lag
lib:AddToggle("auto rebirth", function(state)
    _G.ar = state
    while _G.ar do
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
        wait(0.1)
    end
end, false)

-- uses the gemstore property in order to sustain speed
lib:AddToggle("speed", function(state)
    if state then
	game:GetService("Players").LocalPlayer.Data.PlayerData.GemUpgrade1.Value = 200
    else
	game:GetService("Players").LocalPlayer.Data.PlayerData.GemUpgrade1.Value = 2
    end
end, false)

-- loops through an array of codes i found by searching textlabels and looking online
lib:AddButton("redeem all codes", function()
    local codes = {"FREAKYEXPANSION", "FREAKYSTACK", "MATCHMYFREAK", "TRUEFREAKYMEMBER", "FREAKYFRIDAY", "1KFREAKYBUCKS", "FREAKYSHIP", "FREAKMASTER100", "2FREAKY4YOU", "1KACTIVE", "500ACTIVE", "100FREAKYGEMS", "DONTGETSCAMMED"}
    local remote = game:GetService("ReplicatedStorage").Remotes.RedeemCode
    for _, code in ipairs(codes) do
        remote:FireServer(code)
    end
end)

lib:AddButton("remove all zone walls", function()
	game:GetService("Players").LocalPlayer.Data.PlayerData.BestZone.Value = 7
end)

-- teleports you in front of the wall of each zone, also bypasses needing to buy it (u can use the above button to bypass buying aswell)
-- it took me forever to find a working teleport script, thank you https://forum.wearedevs.net/t/20972
lib:AddComboBox("teleport to area", {"spawn", "candy", "ocean", "volcano", "desert", "snow", "tech"}, function(selection)
    local positions = {spawn = CFrame.new(0, 0, 0), candy = CFrame.new(-118, 10, 0), ocean = CFrame.new(-244, 10, 0), volcano = CFrame.new(-377, 10, 0), desert = CFrame.new(-505, 10, 0), snow = CFrame.new(-633, 10, 0), tech = CFrame.new(-763, 10, 0)}
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = positions[selection]
end)

-- doesnt include every gamepass because some are already replicated in the script, and some just dont work for some reason
local gamepasses = game:GetService("Players").LocalPlayer.Data.Gamepasses

lib:AddToggle("2x luck gamepass", function(state)
    gamepasses.Lucky.Value = state
end, false)

lib:AddToggle("triple egg open gamepass", function(state)
    gamepasses.TripleEgg.Value = state
end, false)

lib:AddToggle("auto egg open gamepass", function(state)
    gamepasses.AutoEgg.Value = state
end, false)

-- everything past this point was made by agreed69, he let me use his code
-- i just added more eggs, his only had spawn eggs

lib:AddToggle("Auto Open Eggs", function(state)
    if state then
        _G.loop2 = true
        while _G.loop2 do
            if egg and amount then
                game:GetService("ReplicatedStorage").Remotes.Egg:InvokeServer(egg, amount)
            end
            wait()
        end
    else
        _G.loop2 = false
    end
end, false)

lib:AddComboBox("Egg", {"Basic Egg", "Rare Egg", "Food Egg", "Sweets Egg", "Ocean Egg", "Lava Egg", "Cactus Egg", "Frozen Egg", "Futuristic Egg", "Grass Egg"}, function(selection)
    egg = selection
end)

-- used to be able to open more, game kicks you if you do that now :(
lib:AddComboBox("Amount", {"1", "2", "3"}, function(selection)
    amount = tonumber(selection)
end)