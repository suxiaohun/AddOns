-- *********************************
-- *  Alert when find rare unit    *
-- *********************************

local unitFrame = CreateFrame("Frame", nil, UIParent)
unitFrame:RegisterEvent("NAME_PLATE_CREATED")
unitFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
unitFrame:SetScript("OnEvent", function(unitBarId)
    for i, plate in ipairs(C_NamePlate.GetNamePlates(issecure())) do
        if plate then
            if plate.UnitFrame.healthBar then
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
            end
        end
    end
end
)