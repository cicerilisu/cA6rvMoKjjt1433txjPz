getgenv().Settings = {
    host = 2725017616,
    fps = 10,
    prefix = "/",
    HostLowerGFX = false,
    AdvertMessage = "cxcontrol"
}

getgenv().Addons = {
    {"@chcxkn", "ExampleAddon", "v1.1"}
}

getgenv().Alts = {
    Alt1 = 3209734584,
    Alt2 = 3209739955, -- BlushedDHC_2
    Alt3 = 3209740598,
	Alt4 = 3209741288, -- BlushedDHC_4
	Alt5 = 3436385538, -- BlushedDHC_50
	Alt6 = 3436387530, -- BlushedDHC_60
	Alt7 = 3211517328, -- BlushedDHC_7
	Alt8 = 3211518838, -- BlushedDHC_8
	Alt9 = 3211520385, -- BlushedDHC_9
	Alt10 = 3319206334, -- BlushedDHC_10
    Alt11 = 2725017616
}

-----------

local cxlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cicerilisu/cA6rvMoKjjt1433txjPz/main/cxlib.lua"))
local isHost = false

local LoadedPackages = {}
local LoadedFunctions = {}

if not game:IsLoaded() then
    game.Loaded:Wait()
end


loadstring(game:HttpGet("https://raw.githubusercontent.com/cicerilisu/cA6rvMoKjjt1433txjPz/main/extras/AnticheatDisabler.lua"))

if game:GetService("Players").LocalPlayer.UserId == getgenv().Settings.host then
    isHost = true
    cxlib:sendMessageRequest("This is host.")
else
    for i = 1, #getgenv().Alts, 1 do
        if game:GetService("Players"):GetPlayerByUserId(getgenv().Alts["Alt" .. i]) ~= nil then
            if game:GetService("Players").LocalPlayer.UserId == getgenv().Alts["Alt" .. i] then
                
                print("[cxcontrol] This is an alt.")
                print("[cxcontrol] ^^ Alt" .. i .. "^^")
                
                cxlib:sendMessageRequest("cx v1.0 BETA")

            end
        end
    end
    print("[cxcontrol] user is not grouped.")
    return
end

-- Check if package is already loaded // Load package
function LoadPackage(name)
    name = name:lower()
    if LoadedPackages[tostring(name:lower())] ~= nil then
        return "package already initialized"
    end

    LoadedPackages[tostring(name)] = true

    request = HttpPost or request or http_request or syn.request

    Response = request({
        Url = "https://raw.githubusercontent.com/accountnameidk/reponameidk/commands/" .. name .. "Command.lua"
    }) 

    if Response.StatusCode ~= 200 then
        return "something went wrong"
    end

    LoadedFunctions[tostring(name)] = loadstring(Response.Body)
end

-- Handle received messages
function handleCommand(rawMessage)
    if isHost then return end
    if tostring(rawMessage:lower()):find(getgenv().Settings.prefix:lower()) and not tostring(rawMessage:lower()):find(" ") then
        message = rawMessage:lower():gsub(getgenv().Settings.prefix, "")
        
        if LoadedPackages(message) ~= "package already initialized" then
            LoadedFunctions[message]()
        end
    else
        args = rawMessage:lower():split(" ")

        if args[1]:find(getgenv().Settings.prefix) then
            message = rawMessage:lower():gsub(getgenv().Settings.prefix, "")
            args = rawMessage:split(" "):gsub(getgenv().Settings.prefix, "")

            if LoadedPackages(message) ~= "package already initialized" then
                LoadedFunctions[args[1]](args)
            end
        end
    end
end

-- Receive messages 
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnMessageDoneFiltering:Connect(function(inputData)
    if game:GetService("Players"):FindFirstChild(inputData.FromSpeaker).UserId == getgenv().Settings.host then
        handleCommand(data.Message)
    end
end)
