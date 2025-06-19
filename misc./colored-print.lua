local Modules = {
    Colors = {
        ["Red"] = "255,0,0", ["Green"] = "0,255,0", ["Blue"] = "0,0,255",
        ["Cyan"] = "33,161,163", ["Magenta"] = "255,0,255", ["Yellow"] = "255,255,0",
        ["Orange"] = "255,165,0", ["Purple"] = "128,0,128", ["Pink"] = "255,105,180",
        ["White"] = "255,255,255", ["Black"] = "0,0,0", ["Gray"] = "128,128,128",
        ["Lime"] = "50,205,50", ["Teal"] = "0,128,128", ["Indigo"] = "75,0,130", ["Brown"] = "139,69,19",
        ["LightRed"] = "255,102,102", ["LightGreen"] = "144,238,144", ["LightBlue"] = "173,216,230",
        ["LightCyan"] = "224,255,255", ["LightMagenta"] = "238,130,238", ["LightYellow"] = "255,255,224",
        ["LightOrange"] = "255,200,124", ["LightPurple"] = "216,191,216", ["LightPink"] = "255,182,193",
        ["LightGray"] = "211,211,211", ["LightLime"] = "204,255,144", ["LightTeal"] = "144,224,224",
        ["LightIndigo"] = "191,148,228", ["LightBrown"] = "210,180,140"
    }
}

Modules.ChangeColor = function()
    game:GetService("RunService").Heartbeat:Connect(function()
        local log = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster")
        if log then
            log = log:FindFirstChild("DevConsoleWindow")
            if log then
                log = log:FindFirstChild("DevConsoleUI")
                if log then
                    log = log:FindFirstChild("MainView")
                    if log then
                        log = log:FindFirstChild("ClientLog")
                        if log then
                            for _, v in pairs(log:GetDescendants()) do
                                if v:IsA("TextLabel") then
                                    v.RichText = true
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end

Modules.ClearOwnLogs = function()
    local log = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster")
    if not log then return end
    log = log:FindFirstChild("DevConsoleWindow")
    if not log then return end
    log = log:FindFirstChild("DevConsoleUI")
    if not log then return end
    log = log:FindFirstChild("MainView")
    if not log then return end
    log = log:FindFirstChild("ClientLog")
    if not log then return end

    for _, label in pairs(log:GetDescendants()) do
        if label:IsA("Frame") and label.Name ~= "WindowingPadding" then
            label:Destroy()
        end
    end
end

local function Print(color, text, size, overwrite)
    if not Modules.Colors[color] then
        warn("Color was not found!")
        return
    end

    if overwrite then
        Modules.ClearOwnLogs()
    end

    local formatted = '<font color="rgb(' .. Modules.Colors[color] .. ')"'
    if size then
        formatted = formatted .. ' size="' .. tostring(size) .. '"'
    end
    formatted = formatted .. '>' .. tostring(text) .. '</font>'
    print(formatted)
end

Modules.ChangeColor()

return Print
