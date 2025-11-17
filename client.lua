-------------------------------------------------------
--       OX & QB NOTIFY SYSTEM FUNCTIONS             --
-------------------------------------------------------
local function CopyToClipboard(text)
    lib.setClipboard(text)
end
local function ShowNotify(msg)
    if Config.NotifyType == "ox" then
        lib.notify({
            title = 'Coordinate Copied',
            description = msg,
            type = 'success'
        })
    elseif Config.NotifyType == "qb" then
        local QBCore = exports['qb-core']:GetCoreObject()
        QBCore.Functions.Notify(msg, "success")
    end
end
local function FormatVec(short, long, ...)
    local prefix = Config.UseShortName and short or long
    return string.format(prefix, ...)
end

-------------------------------------------------------
--                   COMMANDS & KEYBINDS             --
-------------------------------------------------------

RegisterCommand("vec2", function()
    local p = PlayerPedId()
    local c = GetEntityCoords(p)
    local text = FormatVec("vec2(%.2f, %.2f)", "vector2(%.2f, %.2f)", c.x, c.y)
    CopyToClipboard(text)
    ShowNotify(Config.Notify.Vec2)
end, false)

RegisterCommand("vec3", function()
    local p = PlayerPedId()
    local c = GetEntityCoords(p)
    local text = FormatVec("vec3(%.2f, %.2f, %.2f)", "vector3(%.2f, %.2f, %.2f)", c.x, c.y, c.z)
    CopyToClipboard(text)
    ShowNotify(Config.Notify.Vec3)
end, false)

RegisterCommand("vec4", function()
    local p = PlayerPedId()
    local c = GetEntityCoords(p)
    local h = GetEntityHeading(p)
    local text = FormatVec("vec4(%.2f, %.2f, %.2f, %.2f)", "vector4(%.2f, %.2f, %.2f, %.2f)", c.x, c.y, c.z, h)
    CopyToClipboard(text)
    ShowNotify(Config.Notify.Vec4)
end, false)

RegisterCommand("head", function()
    local h = GetEntityHeading(PlayerPedId())
    CopyToClipboard(string.format("%.2f", h))
    ShowNotify(Config.Notify.Heading)
end, false)

RegisterKeyMapping("vec4", Config.KeymapLabels.Vec4, "keyboard", "9")
RegisterKeyMapping("vec3", Config.KeymapLabels.Vec3, "keyboard", "8")
RegisterKeyMapping("vec2", Config.KeymapLabels.Vec2, "keyboard", "7")
RegisterKeyMapping("head", Config.KeymapLabels.Heading, "keyboard", "6")
