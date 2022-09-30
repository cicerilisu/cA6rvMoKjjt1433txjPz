return function (...)
    args = commandArguments(...)

    if args[2] == nil then        
        print("[cxcontrol] Failed to set FPS value (FPS value missing)")
        if game:GetService("Players").LocalPlayer.UserId == getgenv().Alts.Alt1 then
            cxlib:sendMessageRequest("Please provide a FPS value!") 
        end
    elseif tonumber(args[2]) == nil then
        print("[cxcontrol] Failed to set FPS value (FPS value not numeric/nil)")
        if game:GetService("Players").LocalPlayer.UserId == getgenv().Alts.Alt1 then
            cxlib:sendMessageRequest("Invalid fps value")
        end
    elseif not crashing then
        setfpscap(tonumber(args[2]))
        sendMessage("Fps set to " .. tostring(args[2]))
    end
end
