local start_time = 0
local end_time = 0
local total_time = 0
local total_damage = 0
local average_dps = 0
local playerGUID = UnitGUID("player")

local damage_table = {}
damage_table[0] = { 1, 1, 1 }
damage_table[1] = { 1, 1, 0 }
damage_table[2] = { 1, 0.93, 0.5 }
damage_table[4] = { 1, 0.5, 0 }
damage_table[8] = { 0.35, 1, 0.35 }
damage_table[16] = { 0.5, 0.5, 1 }
damage_table[32] = { 0.5, 0.5, 1 }
damage_table[64] = { 1, 0.5, 1 }
damage_table[124] = { 0.33, 0.5, 0.8 }
damage_table[127] = { 0.33, 0.5, 0.8 }

local frame2 = CreateFrame("Frame", nil, UIParent)
frame2:SetHeight(70)
frame2:SetWidth(270)
frame2:SetPoint("CENTER", UIParent, "CENTER", 10, 120)

local fs = frame2:CreateFontString()

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

    fs:SetPoint("TOPLEFT", frame2, "TOPLEFT", x, y)
    fs:SetFontObject(GameFontNormal)
    fs:SetFont("Fonts\\ARHei.ttf", size, "OUTLINE, MONOCHROME")
    fs:SetTextColor(color[1], color[2], color[3])
    fs:SetText(msg)
end

function ClearCombatNumber()
    fs:SetText("")
end

frame2:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame2:RegisterEvent("PLAYER_REGEN_ENABLED")

local function showDamageNumber(self, event)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
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
    elseif event == "PLAYER_REGEN_ENABLED" then
        --ChatFrame1:AddMessage("离开战斗")
        C_Timer.After(2.5, ClearCombatNumber)
    end
end

frame2:SetScript("OnEvent", showDamageNumber)