print("cxlib loaded")

local cxlib = {}

function commandArguments(...)
    local one = {}
    for k, v in pairs(...) do
         if k ~= 1 then
             one[k] = v
         end
    end
    
    return one
 end

function cxlib:sendMessageRequest(message) 
    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        .SayMessageRequest:FireServer(message, "All")
end

return cxlib
