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

cxlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cicerilisu/cA6rvMoKjjt1433txjPz/main/cxlib.lua"))()

local isHost = false
local isAlt = false

local LoadedPackages = {}
local LoadedFunctions = {}

if not game:IsLoaded() then
    game.Loaded:Wait()
end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	task.wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/cicerilisu/cA6rvMoKjjt1433txjPz/main/extras/AnticheatDisabler.lua"))()

if game:GetService("Players").LocalPlayer.UserId == getgenv().Settings.host then
    isHost = true
    cxlib:sendMessageRequest("This is host.")
else

    i = 1
    for k, v in pairs(getgenv().Alts) do
        if game:GetService("Players").LocalPlayer.UserId == getgenv().Alts["Alt" .. i] then
        else
            i += 1
        end
    end

    if cxlib:isAlt(game:GetService("Players").LocalPlayer.UserId) then
        print("[cxcontrol] This is an alt.")
        print("[cxcontrol] ^^ Alt" .. i .. "^^")

        isAlt = true

        cxlib:sendMessageRequest("cx v1.0 BETA")
    end





    if not isAlt then
        print("[cxcontrol] user is not grouped.")
    end

end

-- Check if package is already loaded // Load package
function LoadPackage(name)
   
    commandName = name:lower():gsub("/", ""):split(" ")[1]
    
    if LoadedPackages[tostring(commandName)] ~= nil then
        return "package already initialized"
    end


    request = HttpPost or request or http_request or syn.request

    Response = request({
        Url = "https://raw.githubusercontent.com/cicerilisu/cA6rvMoKjjt1433txjPz/main/commands/" .. commandName .. "Command.lua"
    })

    if Response.Body == "404: Not Found" then
        print("Failed to load command " .. commandName .. " (command not found)")
        return "command not found"
    end

    LoadedPackages[tostring(commandName)] = true

    LoadedFunctions[tostring(commandName)] = loadstring(Response.Body)()
end

-- Handle received messages
function handleCommand(rawMessage)
    if isHost then return end
    print("Received message handle request: " .. rawMessage)
    if tostring(rawMessage:lower()):find(getgenv().Settings.prefix:lower()) and not tostring(rawMessage:lower()):find(" ") then
        message = rawMessage:lower():gsub(getgenv().Settings.prefix, "")

        if LoadedPackages[tostring(message:lower())] ~= nil then
            LoadedFunctions[message]()
        else
            LoadPackage(message)
            for k, v in pairs(LoadedPackages) do
                print(k, "  ", v)
            end
            print("---")
            for k, v in pairs(LoadedFunctions) do
                print(k, "  ", v)
            end

            LoadedFunctions[message]()
        end
    else
        args = rawMessage:lower():split(" ")

        if args[1]:find(getgenv().Settings.prefix) then
            message = rawMessage:lower():gsub(getgenv().Settings.prefix, "")
            args = message:split(" ")

            if LoadedPackages[tostring(message:lower())] ~= nil then
                LoadedFunctions[args[1]](args)
            else
                LoadPackage(message)
                for k, v in pairs(LoadedPackages) do
                    print(k, "  ", v)
                end
                print("---")
                for k, v in pairs(LoadedFunctions) do
                    print(k, "  ", v)
                end
                
                LoadedFunctions[args[1]](args)
            end
        end
    end
end

-- Receive messages

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(inputData)
    if game:GetService("Players"):FindFirstChild(inputData.FromSpeaker).UserId == getgenv().Settings.host and not isHost then
        handleCommand(inputData.Message)
    end
end)
