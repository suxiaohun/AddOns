-- ************************************
-- *  Show player attributes details  *
-- ************************************

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

    str = "爆击 " .. format("%.2f%%\n", real_crit_chance)

    if mastery and mastery > 0 then
        str = str .. "精通 " .. format("%.2f%%\n", mastery)
    end

    local versatility = GetCombatRatingBonus(29)
    if versatility and versatility > 0 then
        str = str .. "全能 " .. format("%.2f%%\n", versatility)
    end

    local haste = UnitSpellHaste("player")
    if haste and haste > 0 then
        str = str .. "急速 " .. format("%.2f%%\n", haste)
    end

    local lifeSteal = GetLifesteal()
    if lifeSteal and lifeSteal > 0 then
        str = str .. "吸血 " .. format("%.2f%%\n", lifeSteal)
    end

    local moveSpeed = GetUnitSpeed("player") * 100 / 7
    if moveSpeed and moveSpeed >0 then
        str = str .. "移速 " .. format("%.2f%%\n", moveSpeed)
    end

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


















