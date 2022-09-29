local hasAirlocked = false
return function ()

    if not hasAirlocked then
        print("[cx] [debug] Airlocking")
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = 
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)

        task.wait(1)
        
        local Vel = Instance.new("BodyVelocity", game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
        Vel.MaxForce = Vector3.new(1, 1, 1) * math.huge
        Vel.P = math.huge
        Vel.Velocity = Vector3.new(0, 0, 0)
        
        task.wait(.2)
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
        print("[cx] Finished")

        hasAirlocked = true

        task.wait(.2)
    end


    print("[cx] [debug] Airlocking")
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false

    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = 
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)

    task.wait(1)
    
    local Vel = Instance.new("BodyVelocity", game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
    Vel.MaxForce = Vector3.new(1, 1, 1) * math.huge
    Vel.P = math.huge
    Vel.Velocity = Vector3.new(0, 0, 0)
    
    task.wait(.2)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
    print("[cx] Finished")

end
