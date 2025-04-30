-- BananaHub: Combined Tab Shop + Tab Status and Server (Rayfield UI)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BananaHub",
    LoadingTitle = "BananaHub Loader",
    LoadingSubtitle = "by ngvu1108",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "BananaHub",
       FileName = "BananaHubConfig"
    },
    Discord = {
       Enabled = false
    },
    KeySystem = false
})

-- Tab: Shop
local ShopTab = Window:CreateTab("Shop", 4483362458)

ShopTab:CreateInput({
    Name = "Redeem Code",
    PlaceholderText = "Enter Code",
    RemoveTextAfterFocusLost = true,
    Callback = function(code)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
    end,
})

local function TeleportToSea(sea)
    local seas = {
        ["Sea 1"] = Vector3.new(1039, 0, 1235),
        ["Sea 2"] = Vector3.new(5785, 0, 202),
        ["Sea 3"] = Vector3.new(-1234, 0, 9504),
    }
    local coord = seas[sea]
    if coord then
        game.Players.LocalPlayer.Character:MoveTo(coord)
    end
end

ShopTab:CreateDropdown({
    Name = "Teleport Sea",
    Options = {"Sea 1", "Sea 2", "Sea 3"},
    CurrentOption = "Sea 1",
    Callback = function(selected)
        TeleportToSea(selected)
    end
})

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

ShopTab:CreateDropdown({
    Name = "Buy Fighting Style",
    Options = table.keys(styles),
    CurrentOption = "Black Leg",
    Callback = function(style)
        game:GetService("ReplicatedStorage").Remotes[styles[style]]:InvokeServer()
    end
})

local abilities = {
    ["Sky Jump"] = "Geppo",
    ["Buso Haki"] = "Buso",
    ["Observation Haki"] = "Ken",
    ["Soru"] = "Soru"
}

ShopTab:CreateDropdown({
    Name = "Buy Abilities",
    Options = table.keys(abilities),
    CurrentOption = "Sky Jump",
    Callback = function(ab)
        game:GetService("ReplicatedStorage").Remotes["BuyHaki"]:InvokeServer(abilities[ab])
    end
})

ShopTab:CreateButton({
    Name = "Buy Dual Flintlock",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.BuyItem:InvokeServer("Dual Flintlock")
    end
})
ShopTab:CreateButton({
    Name = "Reroll Race",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Reroll:InvokeServer()
    end
})
ShopTab:CreateButton({
    Name = "Reset Stats",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.ResetStats:InvokeServer()
    end
})
ShopTab:CreateButton({
    Name = "Buy Race: Cyborg",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.BuyRace:InvokeServer("Cyborg")
    end
})
ShopTab:CreateButton({
    Name = "Buy Race: Ghoul",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.BuyRace:InvokeServer("Ghoul")
    end
})

-- Tab: Status and Server
local StatusTab = Window:CreateTab("Status & Server", 4483362458)

StatusTab:CreateParagraph({Title = "Player Info", Content = "Name: " .. game.Players.LocalPlayer.Name})

StatusTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

StatusTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
        for _, v in pairs(servers) do
            if v.playing < v.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                break
            end
        end
    end
})
