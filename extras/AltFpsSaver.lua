for k, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == ("AirSounds" or "Camera" or "Lights") then
        v:Destroy()
    end
end

-- Delete Lightning Service
if game:FindService("Lightning") ~= nil then
    game:GetService("Lighting"):Destroy()
end 

-- Delete Sewer Liquid
for k, v in pairs(game:GetService("Workspace").MAP.Map:GetChildren()) do
    if v.Name == "Sewer Liquid" then
        v:Destroy()
    end
end

-- delete images
for k, v in pairs(game.Workspace.MAP:GetChildren()) do
    if v:IsA("Part") then
        v:Destroy()
    end

    if v:IsA("Decal") then
        v:Destroy()
    end

    if v:IsA("Folder") and not (v.Name == "Map" or v.Name == "CarnivalPlace" or v.Name == "Indestructible") then
        v:Destroy()
    end
end

-- Derender Map & Destroy Decals
for k, v in pairs(game.Workspace.MAP:GetDescendants()) do
    if v:IsA("Part") then
        v.Transparency = 1
    end

    if v:IsA("Decal") then
        v:Destroy()
    end
end


for k, v in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
    if v:IsA("Part") then
        v.Transparency = 1
    end

    if v:IsA("Decal") then
        v:Destroy()
    end
end

-- Derender Shops & Destroy Decals
for k, v in pairs(game:GetService("Workspace").Ignored:GetDescendants()) do
    if v.Parent.Name ~= "Shop" then
        if v:IsA("Part") then
            v.Transparency = 1
        end

        if v:IsA("Decal") then
            v:Destroy()
        end
    end
end

-- Derender CarnivalPlace
for k, v in pairs(game:GetService("Workspace").MAP.CarnivalPlace:GetChildren()) do
    if v:IsA("Part") then
        v.Transparency = 1
    end
end


-- Derender CarnivalPlaces descendants
for k, v in pairs(game:GetService("Workspace").MAP.CarnivalPlace:GetDescendants()) do
    if v:IsA("Part") then
        v.Transparency = 1
    end
end

if game:GetService("Workspace").Map:FindFirstChild("Fences/UF") ~= nil then
    game:GetService("Workspace").Map:FindFirstChild("Fences/UF"):Destroy()    
end

for k, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:IsA("Folder") then
        if not (v.Name == "Ignored" or v.Name == "MAP" or v.Name == "Players" or v.Name == "Vehicles") then
            v:Destroy()
        end
    end    
end

for k, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:IsA("Model") then
        v:Destroy()
    end
end

for k, v in pairs(game:GetService("Workspace").MAP:GetDescendants()) do

    if (v:IsA("SpotLight") or v:IsA("Lighting") or v:IsA("Light") or v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("MeshPart")) then
        v:Destroy()
    end

    if v:IsA("TextLabel") then
        v.Transparency = 1
    end
end

for k, v in pairs(game:GetService("Workspace").Ignored:GetDescendants()) do

    if (v:IsA("SpotLight") or v:IsA("Lighting") or v:IsA("Light") or v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("MeshPart")) then
        v:Destroy()
    end

    if v:IsA("TextLabel") then
        v.Transparency = 1
    end
end

if game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Blue bottle") ~= nil then
    game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Blue bottle"):Destroy()
end

if game:GetService("Workspace").Ignored:FindFirstChild("Help the patient for money") ~= nil then
    game:GetService("Workspace").Ignored:FindFirstChild("Help the patient for money"):Destroy()
end