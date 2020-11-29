QuestFont:SetFont("Fonts\\ARKai_T.ttf", 40)
--SetCVar("nameplateGlobalScale", 1.5)
--SetCVar("nameplateMaxAlpha", 0.5)
--SetCVar("nameplateShowAll", 1)
--SetCVar("NameplatePersonalShowAlways", 1)
--SetCVar("nameplateShowFriendlyGuardians", 1)
--SetCVar("NamePlateVerticalScale", 1.5)
--SetCVar("nameplateMaxScale", 1.5)
--SetCVar("nameplateSelectedScale", 1.5)
--SET profanityFilter "0"
--SET enableFloatingCombatText "0"
--SET floatingCombatTextCombatDamage "0"
--SetCVar(floatingCombatTextCombatDamage, 0

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

local statFrame = CreateFrame("Frame", nil, UIParent)
statFrame:SetHeight(200)
statFrame:SetMovable(true)
statFrame:EnableMouse(true)
statFrame:RegisterForDrag("LeftButton")
statFrame:SetScript("OnDragStart", statFrame.StartMoving)
statFrame:SetScript("OnDragStop", statFrame.StopMovingOrSizing)

statFrame:SetWidth(100)
statFrame:SetPoint("TOP", UIParent, "CENTER", -300, 0)


local sf1 = statFrame:CreateFontString()
--statFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
statFrame:SetScript("OnEvent", function(event)
    UpdateStatInfo()
end
)

C_Timer.NewTicker(1, function()
    UpdateStatInfo()
end)


local info_frame = CreateFrame("Frame", nil, UIParent)
info_frame:SetHeight(30)
info_frame:SetWidth(700)
info_frame:SetPoint("TOP", UIParent, "TOP", -300, 0)

local fs3 = info_frame:CreateFontString()
local fs4 = info_frame:CreateFontString()
local fs5 = info_frame:CreateFontString()
local fs6 = info_frame:CreateFontString()
local fs = frame2:CreateFontString()

--info_frame:RegisterEvent("PLAYTIME_CHANGED")
--info_frame:RegisterEvent("COMBAT_RATING_UPDATE")
--info_frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
--info_frame:SetScript("OnEvent", function(event)
--    --ChatFrame1:AddMessage('....')
--    UpdateCombatRating()
--end
--)

function UpdateStatInfo()
    mastery, coefficient = GetMasteryEffect()
    base, effectiveArmor, armor, posBuff, negBuff = UnitArmor('player')
    base, Agility, posBuff, negBuff = UnitStat("player", 2)
    base, Stamina, posBuff, negBuff = UnitStat("player", 3)
    lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod = UnitDamage("player");

    local crit_chance_bons = 0
    for i = 1, 30 do
        local name, _, count, _, _, _, _, _, _, id = UnitBuff("player", i)
        if name then
            --print(name.."---"..id.."---"..count)
            if id == 257946 then
                crit_chance_bons = crit_chance_bons + 3 * count
            end
            if id == 193530 then
                crit_chance_bons = crit_chance_bons + 10
            end
        end
    end

    real_crit_chance = GetCritChance() + crit_chance_bons

    sf1:SetPoint("TOPLEFT", statFrame, "TOPLEFT")
    sf1:SetFontObject(GameFontNormal)
    sf1:SetFont("Fonts\\ARHei.ttf", 24, "OUTLINE, MONOCHROME")
    --fs3:SetTextColor(color[1],color[2],color[3])
    --str = "爆击 " .. format("%.2f%%", GetCritChance())
    str = "爆击 " .. format("%.2f%%\n", real_crit_chance)
    --str = "爆击 " .. format("%.2f%%", GetSpellCritChance(1))

    -- 绿字百分比（不包含人物本身属性）
    --str = "爆击 " .. format("%.2f%%", GetCombatRatingBonus(9))
    --str =str.. "爆击 " .. format("%.2f%%", GetCombatRatingBonus(10))
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRatingBonus(11))

    -- 装备绿字数值+buff（不包含人物本身属性，但天赋未加成进去）
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRating(9))
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRating(10))
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRating(11))

    str = str .. "精通 " .. format("%.2f%%\n", mastery)

    local versatility = GetCombatRatingBonus(29)
    if versatility and versatility > 0 then
        str = str .. "全能 " .. format("%.2f%%\n", versatility)
    end

    local haste = UnitSpellHaste("player")
    if haste and haste > 0 then
        str = str .. "急速 " .. format("%.2f%%\n", haste)
    end

    local lifesteal = GetLifesteal()
    if lifesteal and lifesteal > 0 then
        str = str .. "吸血 " .. format("%.2f%%\n", lifesteal)
    end

    local movespeed = GetUnitSpeed("player") * 100 / 7
    str = str .. "移速 " .. format("%.2f%%\n", movespeed)

    local dodge = GetDodgeChance()
    if dodge and dodge > 0 then
        str = str .. "躲闪 " .. format("%.2f%%\n", dodge)
    end

    local avoid = GetCombatRatingBonus(21)
    if avoid and avoid > 0 then
        str = str .. "豁免 " .. format("%.2f%%\n", avoid)
    end

    local parry = GetParryChance()
    if parry and parry > 0 then
        str = str .. "招架 " .. format("%.2f%%\n", parry)
    end

    local mainSpeed, offSpeed = UnitAttackSpeed("player")
    str = str .. "攻速 " .. format("%.2f\n", mainSpeed)

    local map = C_Map.GetBestMapForUnit("player")
    if (map) then
        local position = C_Map.GetPlayerMapPosition(map, "player")
        if (position) then
            str = str .. "坐标 " .. format("%.2f,%.2f\n", position.x * 100, position.y * 100)
        end
    end
    sf1:SetText(str)
end

function UpdateCombatRating()
    mastery, coefficient = GetMasteryEffect()
    base, effectiveArmor, armor, posBuff, negBuff = UnitArmor('player')
    base, Agility, posBuff, negBuff = UnitStat("player", 2)
    base, Stamina, posBuff, negBuff = UnitStat("player", 3)
    lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod = UnitDamage("player");

    local crit_chance_bons = 0
    for i = 1, 30 do
        local name, _, count, _, _, _, _, _, _, id = UnitBuff("player", i)
        if name then
            --print(name.."---"..id.."---"..count)
            if id == 257946 then
                crit_chance_bons = crit_chance_bons + 3 * count
            end
            if id == 193530 then
                crit_chance_bons = crit_chance_bons + 10
            end
        end
    end

    real_crit_chance = GetCritChance() + crit_chance_bons

    fs3:SetPoint("TOPLEFT", info_frame, "TOPLEFT")
    fs3:SetFontObject(GameFontNormal)
    fs3:SetFont("Fonts\\ARHei.ttf", 30, "OUTLINE, MONOCHROME")
    --fs3:SetTextColor(color[1],color[2],color[3])
    --str = "爆击 " .. format("%.2f%%", GetCritChance())
    str = "爆击 " .. format("%.2f%%", real_crit_chance)
    --str = "爆击 " .. format("%.2f%%", GetSpellCritChance(1))

    -- 绿字百分比（不包含人物本身属性）
    --str = "爆击 " .. format("%.2f%%", GetCombatRatingBonus(9))
    --str =str.. "爆击 " .. format("%.2f%%", GetCombatRatingBonus(10))
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRatingBonus(11))

    -- 装备绿字数值+buff（不包含人物本身属性，但天赋未加成进去）
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRating(9))
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRating(10))
    --str = str.."爆击 " .. format("%.2f%%", GetCombatRating(11))

    str = str .. " 精通 " .. format("%.2f%%", mastery)
    str = str .. " 全能 " .. format("%.2f%%", GetCombatRatingBonus(29))
    str = str .. " 急速 " .. format("%.2f%%", UnitSpellHaste("player"))
    fs3:SetText(str)

    fs4:SetPoint("TOPLEFT", info_frame, "TOPLEFT", 0, -40)
    fs4:SetFontObject(GameFontNormal)
    fs4:SetFont("Fonts\\ARHei.ttf", 30, "OUTLINE, MONOCHROME")
    str = "闪避 " .. format("%.2f%%", GetCombatRatingBonus(21))
    str = str .. " 躲闪 " .. format("%.2f%%", GetDodgeChance())
    str = str .. " 招架 " .. format("%.2f%%", GetParryChance())

    str = str .. " 吸血 " .. format("%.2f%%", GetLifesteal())
    str = str .. " 移速 " .. format("%.2f%%", GetUnitSpeed("player") * 100 / 7)
    fs4:SetText(str)

    posY, posX, posZ, instanceID = UnitPosition("player");
    if posX == 0 then

    else
        fs5:SetPoint("TOPLEFT", info_frame, "TOPLEFT", 0, -80)
        fs5:SetFontObject(GameFontNormal)
        fs5:SetFont("Fonts\\ARHei.ttf", 30, "OUTLINE, MONOCHROME")
        str = "坐标 " .. format("%d,%d,%d", posX, posY, instanceID)
        str = str .. " 敏捷 " .. format("%d", Agility)
        str = str .. " 耐力 " .. format("%d", Stamina)
        str = str .. " 护甲 " .. format("%d", effectiveArmor)
        fs5:SetText(str)
    end
    base, posBuff, negBuff = UnitRangedAttackPower("player");
    mainSpeed, offSpeed = UnitAttackSpeed("player");
    if offSpeed then
    else
        offSpeed = 0
    end

    fs6:SetPoint("TOPLEFT", info_frame, "TOPLEFT", 0, -120)
    fs6:SetFontObject(GameFontNormal)
    fs6:SetFont("Fonts\\ARHei.ttf", 30, "OUTLINE, MONOCHROME")
    str = "伤害 " .. format("%d~%d %d~%d %.2f %.2f", lowDmg, hiDmg, offlowDmg, offhiDmg, mainSpeed, offSpeed)

    fs6:SetText(str)

end

function CombatInfo_OnLoad(frame)
    frame:RegisterEvent("UNIT_COMBAT")
    frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")
    frame:RegisterEvent("PLAYER_REGEN_DISABLED")
    frame:RegisterForClicks("RightButtonUp")
    frame:RegisterForDrag("LeftButton")
end

function CombatInfo_OnEvent(frame, event, ...)
    --ChatFrame1:AddMessage(event)
    --UpdateCombatRating()
    if event == "PLAYER_REGEN_ENABLED" then
        ChatFrame1:AddMessage("leave combat")
        C_Timer.After(3, ClearCombatNumber)
        --CombatInfoFrameText:SetText(GetUnitSpeed("player"))
    elseif event == "PLAYER_REGEN_DISABLED" then
        ChatFrame1:AddMessage("in combat")
        --CombatInfoFrameText:SetText("in combat")
        total_damage = 0
        start_time = GetTime()
    elseif event == "UNIT_COMBAT" then
        -- unit: target,player,nameplate1..
        -- Action:  (HEAL, DODGE, BLOCK, WOUND, MISS, PARRY, RESIST, ...)
        -- Damage type: in numeric value (1 - physical; 2 - holy; 4 - fire; 8 - nature; 16 - frost; 32 - shadow; 64 - arcane)
        if not InCombatLockdown() then

        else
            local unit, action, modifier, damage, damagetype = ...
            if unit == "target" and action ~= "HEAL" then
                ChatFrame1:AddMessage(unit .. "---" .. action .. "---" .. modifier .. "---" .. damage .. "---" .. damagetype)

            end
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...
        local spellId, spellName, spellSchool
        local amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand
        --ChatFrame1:AddMessage("pet".."--"..UnitGUID("pet"))
        --ChatFrame1:AddMessage("source".."--"..sourceGUID.."--"..sourceName)

        if sourceGUID == playerGUID then
            -- ChatFrame1:AddMessage(subevent)
            -- 队伍-- SendChatMessage("---","PARTY")
            -- SendChatMessage("---","SAY")
            -- SAY, ZONE, YELL, GUILD, RAID, WHISPER, or CHANNEL
            -- 打印出来 print("|cFF33FF99Skada|r: ".."---")
            if subevent == "SWING_DAMAGE" then
                amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, ...)
                --ChatFrame1:AddMessage("近战攻击--"..amount)
                total_damage = total_damage + amount
                end_time = GetTime()
                total_time = end_time - start_time
                average_dps = total_damage / total_time
                CombatInfo_UpdateText()
            elseif subevent == "RANGE_DAMAGE" then
                spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, ...)
                --ChatFrame1:AddMessage("远程"..spellName.."--"..amount)
                total_damage = total_damage + amount
                end_time = GetTime()
                total_time = end_time - start_time
                average_dps = total_damage / total_time
                CombatInfo_UpdateText()
            elseif subevent == "SPELL_DAMAGE" then
                spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, ...)
                --如果目标死亡太快，此事件会先触发，开始时间会计算错误
                --ChatFrame1:AddMessage("技能".."--"..spellName.."--"..amount)
                total_damage = total_damage + amount
                end_time = GetTime()
                total_time = end_time - start_time
                average_dps = total_damage / total_time
                --ChatFrame1:AddMessage(total_damage.."--"..total_time)
                CombatInfo_UpdateText()
            end
        end
    end
end

function CombatInfo_UpdateText()
    local status = string.format("%ds / %d dmg/ %.2f dps", total_time, total_damage, average_dps)
    CombatInfoFrameText:SetText(status)
    --ChatFrame1:AddMessage(start_time.."--"..end_time..".."..total_time)
end

function CombatInfo_ReportDPS()
    local msg = "hello"
    local petIcon, petName, petLevel, petType, petTalents = GetStablePetInfo(2)

    for i = 1, 40 do
        local name, _, count, _, _, _, _, _, _, id = UnitBuff("player", i)
        if name then
            print(name .. "---" .. id .. "---" .. count)
        end
    end

    local map = C_Map.GetBestMapForUnit("player")
    if (map) then
        local position = C_Map.GetPlayerMapPosition(map, "player")
        if (position) then
            print(position:GetXY())
        end
    end


    --if GetNumGroupMembers() > 0 then
    --SendChatMessage(msg,"PARTY")
    --else
    --ChatFrame1:AddMessage(petName)
    --ChatFrame1:AddMessage(GetUnitSpeed("player"))
    --ChatFrame1:AddMessage(GetCritChance())
    --mastery, coefficient = GetMasteryEffect()
    --ChatFrame1:AddMessage(GetMastery())
    --ChatFrame1:AddMessage(mastery)
    --ChatFrame1:AddMessage(UnitSpellHaste("player"))
    --ChatFrame1:AddMessage(GetLifesteal())
    --ChatFrame1:AddMessage(GetCombatRating(26))
    --ChatFrame1:AddMessage(GetCombatRatingBonus(26))

    --ChatFrame1:AddMessage(GetCombatRating(29))
    --ChatFrame1:AddMessage(GetCombatRatingBonus(29))
    --ChatFrame1:AddMessage(GetCombatRatingBonus(30))


    --end
end

local PlayerFramePlus = {}

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

--UpdateCombatNumber("hello")

frame2:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame2:SetScript("OnEvent", function()
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

PlayerFramePlus.frame = frame2



-- local namePlate = C_NamePlate.GetNamePlateForUnit(UnitGUID("target"))

local frame3 = CreateFrame("Frame", nil, UIParent)
local nameplate, extended, bars, regions, visual, carrier, plateid                    -- Temp/Local References
local unit, unitcache, style, stylename, unitchanged

frame3:RegisterEvent("NAME_PLATE_CREATED")
frame3:RegisterEvent("NAME_PLATE_UNIT_ADDED")
frame3:SetScript("OnEvent", function(unitBarId)


    for i, plate in ipairs(C_NamePlate.GetNamePlates(issecure())) do
        if plate then
            local health = plate.UnitFrame.healthBar
            if health then
                --local ssf = health:GetFontString()

                --ssf:SetPoint("TOPLEFT",frame2,"TOPLEFT",x,-y)
                --ssf:SetFontObject(GameFontNormal)
                --ssf:SetFont("Fonts\\ARHei.ttf", size, "OUTLINE, MONOCHROME")
                --ssf:SetTextColor(color[1],color[2],color[3])
                --health:SetText("aaaaaaaaaaa")

                --ChatFrame1:AddMessage(GetTime()..plate.namePlateUnitToken.."--"..health:GetWidth().."--"..health:GetHeight().."--"..UnitHealth(plate.UnitFrame.unit))
                --ChatFrame1:AddMessage(plate.namePlateUnitToken)
                local unitRareFlag = UnitClassification(plate.UnitFrame.unit)
                if unitRareFlag == 'rareelite' then
                    PlaySound(8960)
                    ChatFrame1:AddMessage("发现稀有精英-" .. UnitName(plate.UnitFrame.unit))
                end

                if unitRareFlag == 'rare' then
                    PlaySound(8960)
                    ChatFrame1:AddMessage("发现稀有-" .. UnitName(plate.UnitFrame.unit))
                end

                if unitRareFlag == 'worldboss' then
                    PlaySound(8960)
                    ChatFrame1:AddMessage("发现世界boss-" .. UnitName(plate.UnitFrame.unit))
                end
                if unitRareFlag == 'trivial' then
                    PlaySound(8960)
                    ChatFrame1:AddMessage("发现trivial-" .. UnitName(plate.UnitFrame.unit))
                end
                --if unitRareFlag == 'minus' then
                --    PlaySound(8960)
                --    ChatFrame1:AddMessage("发现minus-" .. UnitName(plate.UnitFrame.unit))
                --end
                --ChatFrame1:AddMessage(plate.UnitFrame.unit)

                --PlaySound(569593)
                --ChatFrame1:AddMessage(UnitClassification(plate.UnitFrame.unit))
                --ChatFrame1:AddMessage(GetTime().."-----"..health:GetWidth().."---bbb")
            end
            --extended = plate.UnitFrame.extended

            --carrier = plate.carrier
            --bars = extended.bars
            --regions = extended.regions
            --unit = plate.unit
            --unitcache = extended.unitcache
            --visual = extended.visual
            --style = extended.style
            --unit.unitid = unitid
            --unit.name = UnitName(unitid)
            --ChatFrame1:AddMessage(GetTime()..unit.name.."---aaaa")
        end

        --local health = frame.UnitFrame.healthBar
        --if health then
        --ChatFrame1:AddMessage(GetTime()..frame.namePlateUnitToken.."---aaaa")
        --end
        --local left = health:GetLeft() - frame:GetLeft();
        --local right = frame:GetRight() - health:GetRight();
        --local top = frame:GetTop() - health:GetTop();
        --local bottom = health:GetBottom() - frame:GetBottom();
        --ChatFrame1:AddMessage(frame.namePlateUnitToken)
        --ChatFrame1:AddMessage(health)
        --self:ApplyFrameOptions(frame, frame.namePlateUnitToken);
        --CompactUnitFrame_SetUnit(frame.UnitFrame, frame.namePlateUnitToken);
    end
    --local namePlateTarget = C_NamePlate.GetNamePlateForUnit("target", issecure());
    --if (namePlateTarget) then
    --ChatFrame1:AddMessage(UnitGUID("target"))
    --ChatFrame1:AddMessage(namePlateTarget.unitFrame.healthBar)
    --end


    --local namePlate = C_NamePlate.GetNamePlateForUnit(UnitGUID("target"))

    --local unitFrame = namePlate.unitFrame
    --local healthBar = unitFrame.healthBar
    --local castBar = unitFrame.castBar
    --ChatFrame1:AddMessage(healthBar)


    --namePlates = C_NamePlate.GetNamePlates()
    --NamePlateDriverMixin:SetBaseNamePlateSize(210, 90);

    --C_NamePlate.SetNamePlateFriendlySize(200,200)
    --C_NamePlate.SetScale(0.5)
    --C_NamePlate.SetNamePlateEnemySize(500,4000)

end
)
















