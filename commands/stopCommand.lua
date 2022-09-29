return function ()
    game:GetService("RunService"):UnbindFromRenderStep("cx_dropping")
    cxlib:sendMessageRequest("end")
end
