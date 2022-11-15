local addonName,NS = ...

NS.f = NS.f or {}

local color_table = {}
color_table["red"] = "\027[31m"
color_table["green"] = "\027[32m"
color_table["orange"] = "\027[33m"
color_table["navy"] = "\027[34m"
color_table["magenta"] = "\027[35m"
color_table["cyan"] = "\027[36m"
color_table["gray"] = "\027[90m"
color_table["grey"] = "\027[90m"
color_table["light_gray"] = "\027[37m"
color_table["light_grey"] = "\027[37m"
color_table["peach"] = "\027[91m"
color_table["light_green"] = "\027[92m"
color_table["yellow"] = "\027[93m"
color_table["blue"] = "\027[94m"
color_table["pink"] = "\027[95m"
color_table["baby_blue"] = "\027[96m"

color_table["strikethrough"] = "\027[9m"
color_table["underline"] = "\027[4m"
color_table["bold"] = "\027[1m"
color_table["clear"] = "\027[0m"

local function Sprintf(col, string)
    string = string or ""
    local c = "\027[32m"
    if color_table[col] then
        c = color_table[col]
    end
    return c .. string
end

NS.f.Sprintf = Sprintf