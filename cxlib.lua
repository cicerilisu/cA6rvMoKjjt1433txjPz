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

function cxlib:disableCollision()
    for k, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name ~= game:GetService("Players").LocalPlayer.Name  then
            if isAAlt(v.UserId) == true then
                if v.Character then
                    if v.Character:FindFirstChild("Humanoid") then
                        v.Character.Humanoid:Destroy()

                        for k, v in pairs(v.Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                                if v.Name ~= ("HumanoidRootPart" or "LeftFoot") then
                                    v.Name = "nil"
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end




return cxlib
