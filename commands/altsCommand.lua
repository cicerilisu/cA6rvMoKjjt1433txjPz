return function(...)
    print("Executed alts command")
    args = commandArguments(...)

    if args[2] == nil or args == nil or ... == nil then
        if game:GetService("Players").LocalPlayer.UserId == getgenv().Alts.Alt1 then
            cxlib:sendMessageRequest("Please provide an option (spot/line)")
        end
    end

    
    if args[2] == "spot" then
        print("Executed alts command with option 'spot'")

        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored then
            print("Not unlocked! unlocking...")
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end

        
        temp_x = game:GetService("Players"):GetPlayerByUserId(getgenv().Settings.host).Character.HumanoidRootPart.Position.X
        temp_y = game:GetService("Players"):GetPlayerByUserId(getgenv().Settings.host).Character.HumanoidRootPart.Position.Y
        temp_z = game:GetService("Players"):GetPlayerByUserId(getgenv().Settings.host).Character.HumanoidRootPart.Position.Z + 10
        
        repeat 
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(temp_x, temp_y, temp_z)   
            task.wait()
        until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(temp_x, temp_y, temp_z)).Magnitude <= 1

        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored then
            print("Not locked! locking...")
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
        end
    elseif args[2] == "line" then
            
        print("no")

    end

end
