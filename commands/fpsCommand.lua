return function (...)
    print("FPS Command executed!")
    args = commandArguments(...)
    setfpscap(tonumber(args[2]))
    cxlib:sendMessageRequest("FPS set to " .. args[2])
end
