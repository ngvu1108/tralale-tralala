
-- BananaHub Tab Shop (Rayfield UI)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "BananaHub - Tab Shop",
    LoadingTitle = "BananaHub",
    LoadingSubtitle = "by ngvu1108",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BananaHub", 
        FileName = "ShopConfig"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false,
})

local Tab = Window:CreateTab("Shop", 4483362458)

-- Redeem Code
Tab:CreateInput({
    Name = "Redeem Code",
    PlaceholderText = "Enter code here...",
    RemoveTextAfterFocusLost = true,
    Callback = function(code)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
    end,
})

-- Teleport Sea
Tab:CreateDropdown({
    Name = "Teleport to Sea",
    Options = {"Sea 1", "Sea 2", "Sea 3"},
    CurrentOption = "Sea 1",
    Callback = function(sea)
        local seas = {
            ["Sea 1"] = Vector3.new(1039, 0, 1235),
            ["Sea 2"] = Vector3.new(5785, 0, 202),
            ["Sea 3"] = Vector3.new(-1234, 0, 9504),
        }
        local coord = seas[sea]
        if coord then
            game.Players.LocalPlayer.Character:MoveTo(coord)
        end
    end,
})

-- Fighting Style Shop
Tab:CreateDropdown({
    Name = "Buy Fighting Style",
    Options = {
        "Black Leg", "Fishman Karate", "Electro", "Dragon Breath",
        "SuperHuman", "Death Step", "Sharkman Karate",
        "Electric Claw", "Dragon Talon", "God Human", "Sanguine Art"
    },
    Callback = function(style)
        local styles = {
            ["Black Leg"] = "BuyBlackLeg",
            ["Fishman Karate"] = "BuyFishmanKarate",
            ["Electro"] = "BuyElectro",
            ["Dragon Breath"] = "BuyDragonBreath",
            ["SuperHuman"] = "BuySuperHuman",
            ["Death Step"] = "BuyDeathStep",
            ["Sharkman Karate"] = "BuySharkmanKarate",
            ["Electric Claw"] = "BuyElectricClaw",
            ["Dragon Talon"] = "BuyDragonTalon",
            ["God Human"] = "BuyGodHuman",
            ["Sanguine Art"] = "BuySanguineArt"
        }
        local remote = styles[style]
        if remote then
            game:GetService("ReplicatedStorage").Remotes[remote]:InvokeServer()
        end
    end,
})

-- Abilities Shop
Tab:CreateDropdown({
    Name = "Buy Ability",
    Options = {"Sky Jump", "Buso Haki", "Observation Haki", "Soru"},
    Callback = function(ability)
        local abilities = {
            ["Sky Jump"] = "Geppo",
            ["Buso Haki"] = "Buso",
            ["Observation Haki"] = "Ken",
            ["Soru"] = "Soru"
        }
        local val = abilities[ability]
        if val then
            game:GetService("ReplicatedStorage").Remotes["BuyHaki"]:InvokeServer(val)
        end
    end,
})

-- Misc Shop
Tab:CreateButton({
    Name = "Buy Dual Flintlock",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.BuyItem:InvokeServer("Dual Flintlock")
    end,
})

Tab:CreateButton({
    Name = "Reroll Race",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Reroll:InvokeServer()
    end,
})

Tab:CreateButton({
    Name = "Reset Stats",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.ResetStats:InvokeServer()
    end,
})

Tab:CreateButton({
    Name = "Buy Race: Cyborg",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.BuyRace:InvokeServer("Cyborg")
    end,
})

Tab:CreateButton({
    Name = "Buy Race: Ghoul",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.BuyRace:InvokeServer("Ghoul")
    end,
})
