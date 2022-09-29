return function()
    game:GetService("RunService"):BindToRenderStep("cx_dropping", 1, function()
        game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", 10000)
    end)
end
