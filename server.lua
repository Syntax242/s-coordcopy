CreateThread(function()
    local resource = "ox_lib"
    local state = GetResourceState(resource)

    if state ~= "started" and state ~= "starting" then
        print("^1[ERROR] ^7ox_lib not found! This resource requires ox_lib to work.")
        print("^1[ERROR] ^7Please install ox_lib from: https://github.com/overextended/ox_lib")
        StopResource(GetCurrentResourceName())
        return
    end

    print("^2[INFO] ^7ox_lib detected! Resource starting normally.")
end)
