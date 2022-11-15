local addonName,NS = ...

NS.f = NS.f or {}

local minimap_icon_created = false

ChatFrame1:AddMessage("--------------------aaaaaa-----");

local function CreateMinimapIcon()
    if (minimap_icon_created) then
        return
    end

    minimap_icon_created = true

    local LDB = LibStub("LibDataBroker-1.1", true)
    local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)

    if LDB then
        local minimapIcon = LDB:NewDataObject ("xiaosu", {
            type = "111 111",
            icon = [[Interface\MINIMAP\MOVIERECORDINGICON]],

            OnClick = function(self, button)
                if (button == "LeftButton") then
                    ChatFrame1:AddMessage("...click left");
                elseif (button == "RightButton") then
                    ChatFrame1:AddMessage("...click right");
                end
            end,

            OnTooltipShow = function(tooltip)
                tooltip:AddLine("111!: 11 11", 1, 1, 1)
                tooltip:AddLine("|cFFFF7700Left Click|r: open options.")
                tooltip:AddLine("|cFFFF7700Right Click|r: hide this icon.")
            end,
        })

        if (minimapIcon and not LDBIcon:IsRegistered ("xiaosu")) then
            LDBIcon:Register ("xiaosu", minimapIcon, self.db.minimap)
        end
    end
end


NS.f.CreateMinimapIcon = CreateMinimapIcon



--
--local function createButton(name, object, db)
--    local button = CreateFrame("Button", "LibDBIcon10_"..name, Minimap)
--    button.dataObject = object
--    button.db = db
--    button:SetFrameStrata("MEDIUM")
--    button:SetSize(31, 31)
--    button:SetFrameLevel(8)
--    button:RegisterForClicks("anyUp")
--    button:RegisterForDrag("LeftButton")
--    button:SetHighlightTexture(136477) --"Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight"
--    local overlay = button:CreateTexture(nil, "OVERLAY")
--    overlay:SetSize(53, 53)
--    overlay:SetTexture(136430) --"Interface\\Minimap\\MiniMap-TrackingBorder"
--    overlay:SetPoint("TOPLEFT")
--    local background = button:CreateTexture(nil, "BACKGROUND")
--    background:SetSize(20, 20)
--    background:SetTexture(136467) --"Interface\\Minimap\\UI-Minimap-Background"
--    background:SetPoint("TOPLEFT", 7, -5)
--    local icon = button:CreateTexture(nil, "ARTWORK")
--    icon:SetSize(17, 17)
--    icon:SetTexture(object.icon)
--    icon:SetPoint("TOPLEFT", 7, -6)
--    button.icon = icon
--    button.isMouseDown = false
--
--    local r, g, b = icon:GetVertexColor()
--    icon:SetVertexColor(object.iconR or r, object.iconG or g, object.iconB or b)
--
--    icon.UpdateCoord = updateCoord
--    icon:UpdateCoord()
--
--    button:SetScript("OnEnter", onEnter)
--    button:SetScript("OnLeave", onLeave)
--    button:SetScript("OnClick", onClick)
--    if not db or not db.lock then
--        button:SetScript("OnDragStart", onDragStart)
--        button:SetScript("OnDragStop", onDragStop)
--    end
--    button:SetScript("OnMouseDown", onMouseDown)
--    button:SetScript("OnMouseUp", onMouseUp)
--
--    button.fadeOut = button:CreateAnimationGroup()
--    local animOut = button.fadeOut:CreateAnimation("Alpha")
--    animOut:SetOrder(1)
--    animOut:SetDuration(0.2)
--    animOut:SetFromAlpha(1)
--    animOut:SetToAlpha(0)
--    animOut:SetStartDelay(1)
--    button.fadeOut:SetToFinalAlpha(true)
--
--    lib.objects[name] = button
--
--    if lib.loggedIn then
--        updatePosition(button, db and db.minimapPos)
--        if not db or not db.hide then
--            button:Show()
--        else
--            button:Hide()
--        end
--    end
--    lib.callbacks:Fire("LibDBIcon_IconCreated", button, name) -- Fire 'Icon Created' callback
--end