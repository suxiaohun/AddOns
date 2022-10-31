

local frame = CreateFrame("Frame", nil, UIParent)
frame:SetHeight(70)
frame:SetWidth(270)
frame:SetPoint("CENTER", UIParent, "CENTER", 10, 120)


local fs = frame:CreateFontString()

function UpdateCombatNumber(msg, ...)
    size, color_key = ...
    if size == nil then
        size = 50
    end
    if color_key == nil then
        color_key = 1
    end
    --ChatFrame1:AddMessage("....key:"..color_key)
    color = damage_table[color_key]
    if color == nil then
        color = damage_table[1]
    end
    --ChatFrame1:AddMessage(color[1]..color[2]..color[3])
    x = math.random(270)
    y = math.random(70)

    fs:SetPoint("TOPLEFT", frame, "TOPLEFT", x, y)
    fs:SetFontObject(GameFontNormal)
    fs:SetFont("Fonts\\ARHei.ttf", size, "OUTLINE, MONOCHROME")
    fs:SetTextColor(color[1], color[2], color[3])
    fs:SetText(msg)
end

function ClearCombatNumber()
    fs:SetText("")
end

frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function()
    local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()
    local spellId, spellName, spellSchool
    local amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand

    --ChatFrame1:AddMessage(UnitGUID("pet")..sourceName..sourceGUID)
    if sourceGUID == UnitGUID("pet") then

        --ChatFrame1:AddMessage(UnitGUID("pet"))
        if subevent == "SWING_DAMAGE" then
            amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())
            -- CombatInfoNumber:SetFont(nil,50,nil)

            UpdateCombatNumber(amount, 100, 0)
            -- SetFont(FontPath or nil, FontSize or nil, FontExtra or nil)
            -- CombatInfoNumberText:SetText(amount)

        elseif subevent == "RANGE_DAMAGE" then
            spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())
            UpdateCombatNumber(amount)

        elseif subevent == "SPELL_DAMAGE" then
            spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())
            --ChatFrame1:AddMessage(spellName..amount)
            if critical then
                UpdateCombatNumber(amount, 200, spellSchool)
            else
                UpdateCombatNumber(amount, 100, spellSchool)
            end
        elseif subevent == "SPELL_PERIODIC_DAMAGE" then
            spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())
            if critical then
                UpdateCombatNumber(amount, 200, spellSchool)
                --ChatFrame1:AddMessage(spellName..amount..'(暴击)')
            else
                UpdateCombatNumber(amount, 100, spellSchool)
                --ChatFrame1:AddMessage(spellName..amount)
            end

        end
    end
    if sourceGUID == playerGUID then
        --ChatFrame1:AddMessage(subevent)
        -- 队伍-- SendChatMessage("---","PARTY")
        -- SendChatMessage("---","SAY")
        -- SAY, ZONE, YELL, GUILD, RAID, WHISPER, or CHANNEL
        -- 打印出来 print("|cFF33FF99Skada|r: ".."---")
        if subevent == "SWING_DAMAGE" then
            amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())
            -- CombatInfoNumber:SetFont(nil,50,nil)

            UpdateCombatNumber(amount, 100, 0)
            -- SetFont(FontPath or nil, FontSize or nil, FontExtra or nil)
            -- CombatInfoNumberText:SetText(amount)

        elseif subevent == "RANGE_DAMAGE" then
            spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())
            UpdateCombatNumber(amount, 100, 0)
        elseif subevent == "SPELL_DAMAGE" then
            spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())

            if critical then
                UpdateCombatNumber(amount, 200, spellSchool)
            else
                UpdateCombatNumber(amount, 100, spellSchool)
            end
        elseif subevent == "SPELL_PERIODIC_DAMAGE" then
            spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, CombatLogGetCurrentEventInfo())
            if critical then
                UpdateCombatNumber(amount, 200, spellSchool)
                --ChatFrame1:AddMessage(spellName..amount..'(暴击)')
            else
                UpdateCombatNumber(amount, 100, spellSchool)
                --ChatFrame1:AddMessage(spellName..amount)
            end
        end
    end
end
)