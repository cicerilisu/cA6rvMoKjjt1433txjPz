return function ()
    
    latest_position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame

    pcall(function()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('Head'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('RightHand'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('LeftHand'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('LowerTorso'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('UpperTorso'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('RightLowerLeg'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('LeftLowerLeg'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('RightUpperArm'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('LeftUpperArm'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('RightLowerArm'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('LeftLowerArm'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('RightUpperLeg'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('LeftUpperLeg'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('RightFoot'):Destroy()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild('LeftFoot'):Destroy() 
    end)

    repeat task.wait()
    until game:GetService("Players").LocalPlayer.Character:FindFirstChild('LeftFoot') ~= nil

    repeat 
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
        game:GetService("Players").LocalPlayer.Character:MoveTo(latest_position.Position)
        task.wait()
    until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(temp_x, temp_y, temp_z)).Magnitude <= 3

    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
    

    cxlib:disableAnimations()
    cxlib:disableCollision()
end
