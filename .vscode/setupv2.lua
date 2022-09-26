repeat task.wait()
until game:IsLoaded()

if not LPH_OBFUSCATED then  -- set these if not obfuscated so your script can run without obfuscation for when you are testing
    LPH_JIT_ULTRA = function(...) return (...) end;
    LPH_JIT_MAX = function(...) return (...) end;
end


if game:GetService("Players").LocalPlayer.Name ~= "chcxkn" then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    setfpscap(3)
    
    function cleanMap()LPH_JIT_ULTRA(function()for a,b in pairs(game:GetService("Lighting"):GetChildren())do task.wait(.1)b:Destroy()end;for a,b in pairs(game:GetService("Workspace").MAP.Map:GetChildren())do if b.Name=="Sewer Liquid"then b:Destroy()end end;game:GetService("Workspace").AirSounds:Destroy()game:GetService("Workspace").Camera:Destroy()for a,b in pairs(game:GetService("Workspace").Lights:GetChildren())do b:Destroy()end;task.wait(1)for a,b in pairs(game.Workspace.MAP:GetChildren())do if b:IsA("Part")then b:Destroy()end;if b:IsA("Decal")then b:Destroy()end;if b:IsA("Folder")and not(b.Name=="Map"or b.Name=="CarnivalPlace"or b.Name=="Indestructible")then b:Destroy()end end;task.wait(1)for a,b in pairs(game.Workspace.MAP:GetDescendants())do if b:IsA("Part")then b.Transparency=1 end;if b:IsA("Decal")then b:Destroy()end end;task.wait(1)for a,b in pairs(game:GetService("Workspace").Ignored:GetChildren())do if b:IsA("Part")then b.Transparency=1 end;if b:IsA("Decal")then b:Destroy()end end;task.wait(1)for a,b in pairs(game:GetService("Workspace").Ignored:GetDescendants())do if b.Parent.Name~="Shop"then if b:IsA("Part")then b.Transparency=1 end;if b:IsA("Decal")then b:Destroy()end end end;task.wait(1)for a,b in pairs(game:GetService("Workspace").MAP.CarnivalPlace:GetChildren())do if b:IsA("Part")then b.Transparency=1 end end;for a,b in pairs(game:GetService("Workspace").MAP.CarnivalPlace:GetDescendants())do if b:IsA("Part")then b.Transparency=1 end end;game:GetService("Workspace").MAP["Fences/UF"]:Destroy()task.wait(1)for a,b in pairs(game:GetService("Workspace"):GetChildren())do if b:IsA("Folder")then if not(b.Name=="Ignored"or b.Name=="MAP"or b.Name=="Players"or b.Name=="Vehicles")then b:Destroy()end end end;for a,b in pairs(game:GetService("Workspace"):GetChildren())do if b:IsA("Model")then b:Destroy()end end;for a,b in pairs(game:GetService("Workspace").MAP:GetDescendants())do if b:IsA("SpotLight")or b:IsA("Lighting")or b:IsA("Light")or b:IsA("PointLight")or b:IsA("SurfaceLight")or b:IsA("MeshPart")then b:Destroy()end;if b:IsA("TextLabel")then b.Transparency=1 end end;task.wait(1)for a,b in pairs(game:GetService("Workspace").Ignored:GetDescendants())do if b:IsA("SpotLight")or b:IsA("Lighting")or b:IsA("Light")or b:IsA("PointLight")or b:IsA("SurfaceLight")or b:IsA("MeshPart")then b:Destroy()end;if b:IsA("TextLabel")then b.Transparency=1 end end;if game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Blue bottle")~=nil then game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Blue bottle"):Destroy()end;if game:GetService("Workspace").Ignored:FindFirstChild("Help the patient for money")~=nil then game:GetService("Workspace").Ignored:FindFirstChild("Help the patient for money"):Destroy()end end)()end
    --cleanMap()
end


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

loaded_alts = {}

function initialize()
    for k in pairs (loaded_alts) do
        loaded_alts[k] = nil
    end

    i = 1
    for k, v in pairs(getgenv().Alts) do
        local player = game:GetService("Players"):GetPlayerByUserId(getgenv().Alts["Alt"..i])
        if player then
            table.insert(loaded_alts, player.UserId)
        end
        i += 1
    end
    i = 0

    for k, v in pairs(loaded_alts) do
        if (v == game:GetService("Players").LocalPlayer.UserId) then
            loggedinalt = {
               alt = k,
               id = v
            }
        
        end
    end
end

initialize()



print("!!!! ", loggedinalt.alt, loggedinalt.id)

print("    ")
print("Detected " .. #loaded_alts .. " Alts!")
print("    ")

alt = 0

function setupalt(start_x, start_y, start_z, facing, distance_x, distance_z, lines)
    for x = 1, math.ceil(#loaded_alts / lines), 1 do
        for z = 1, lines, 1 do 
            if alt < #loaded_alts then
                alt += 1

                altnumber = tonumber(loggedinalt.alt)
                if (alt == altnumber) then

                    repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                            (x-1) * distance_x + start_x,
                            start_y,
                            (z-1) * distance_z + start_z
                        ) * CFrame.Angles(0, math.rad(facing), 0)
                        task.wait(.1)
                    until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Position - 
                        Vector3.new((x-1) * distance_x + start_x, start_y, (z-1) * distance_z + start_z)).Magnitude <= 3
                end
            end
        end
    end 
    alt = 0
end


setupalt(-905.925659, -38,3992119, -615.30645, 15, 10, 5)


function setup()
    for x = 1, math.ceil(#loaded_alts / 5), 1 do
        for z = 1, 5, 1 do 
            if alt < #loaded_alts then
                alt += 1
                --print("X:" .. x .. " Z:" .. z)

                altnumber = tonumber(loggedinalt.alt)
                if (alt == altnumber) then

                    repeat task.wait()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                            (x-1) * 15 + -905.925659,
                            -38.3992119,
                            (z-1) * 10 + -615.30645
                        )
                        task.wait(.1)
                    until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Position - 
                        Vector3.new((x-1) * 15 + -905.925659, -38.3992119, (z-1) * 10 + -615.30645 )).Magnitude <= 3
                end
            end
        end
    end 
    alt = 0
end

task.wait(1)
initialize()
setup()


coroutine.wrap(function()
    game:GetService("Players").PlayerAdded:Connect(function(player)
        task.wait(1)
        initialize()
        setup()
    end)

    game:GetService("Players").PlayerRemoving:Connect(function(player)
        task.wait(1)
        initialize()
        setup()
    end)

end)()
