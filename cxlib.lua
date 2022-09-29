print("cxlib loaded")

local cxlib = {}

local animationtable = {
    Enum.HumanoidStateType.FallingDown,
    Enum.HumanoidStateType.Running,
    Enum.HumanoidStateType.RunningNoPhysics,
    Enum.HumanoidStateType.Climbing,
    Enum.HumanoidStateType.StrafingNoPhysics,
    Enum.HumanoidStateType.Ragdoll,
    Enum.HumanoidStateType.GettingUp,
    Enum.HumanoidStateType.Jumping,
    Enum.HumanoidStateType.Landed,
    Enum.HumanoidStateType.Flying,
    Enum.HumanoidStateType.Freefall,
    Enum.HumanoidStateType.PlatformStanding,
    Enum.HumanoidStateType.Dead,
    Enum.HumanoidStateType.Swimming,
}

function commandArguments(...)
    local k = {}
    for i,v in pairs(...) do
        if i ~= 1 then
            k[i] = v
        end
    end
    return k
 end

function cxlib:sendMessageRequest(message) 
    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        .SayMessageRequest:FireServer(message, "All")
end

function cxlib:disableAnimations()
    for k, v in pairs(animationtable) do
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):SetStateEnabled(v, false)
    end
end




return cxlib
