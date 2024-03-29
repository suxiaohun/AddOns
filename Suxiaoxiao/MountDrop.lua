local addonName, NS = ...

NS.minimap_db = NS.minimap_db or {}

--local CreateMinimapIcon = NS.f.CreateMinimapIcon



--local CarnackiTestAddon = CreateFrame("Frame", nil, UIParent);
--local CarnackiTestAddonTexBG = CarnackiTestAddon:CreateTexture();
----local CarnackiTestAddonTexTitle = CarnackiTestAddon:CreateTexture();
----local CarnackiTestAddonTexDetails = CarnackiTestAddon:CreateTexture();
--
--CarnackiTestAddon:SetFrameStrata("MEDIUM");
--CarnackiTestAddon:SetWidth(600);
--CarnackiTestAddon:SetHeight(400);
--CarnackiTestAddon:SetPoint("CENTER");
--CarnackiTestAddon:SetMovable(true);
--CarnackiTestAddon:EnableMouse(true);
--
---- Main window background
--CarnackiTestAddon.texture = CarnackiTestAddonTexBG
--CarnackiTestAddonTexBG:SetAllPoints();
--CarnackiTestAddonTexBG:SetColorTexture(0.21,0.27,0.31);
--CarnackiTestAddonTexBG:SetAlpha(1.0);
--
---- Title background
----CarnackiTestAddon.texture = CarnackiTestAddonTexTitle
--CarnackiTestAddonTexTitle:SetAllPoints();
--CarnackiTestAddonTexTitle:SetColorTexture(1,1,0.5);
--CarnackiTestAddonTexTitle:SetAlpha(1.0);

-- Create the title fontstring
--CarnackiTestAddon.font = CarnackiTestAddonFSTitle
--CarnackiTestAddonFSTitle = CarnackiTestAddon:CreateFontString();
--CarnackiTestAddonFSTitle:SetFont("Fonts\\FRIZQT__.TTF", 24);
--CarnackiTestAddonFSTitle:SetPoint("TOPLEFT", 0 , 0);
--CarnackiTestAddonFSTitle:SetTextColor(0,0,0);
--CarnackiTestAddonFSTitle:SetText("TEST");
--CarnackiTestAddonTexTitle:SetAllPoints(CarnackiTestAddonFSTitle);

-- Add details background
--CarnackiTestAddon.texture = CarnackiTestAddonTexDetails
--CarnackiTestAddonTexDetails:SetAllPoints();
--CarnackiTestAddonTexDetails:SetDrawLayer("ARTWORK", 1)
--CarnackiTestAddonTexDetails:SetColorTexture(1.0,1.0,1.0);
----CarnackiTestAddonTexDetails:SetColorTexture(1.0,0.49,0.04);
--CarnackiTestAddonTexDetails:SetAlpha(1.0);

-- Create the details fontstring
--CarnackiTestAddon.font = CarnackiTestAddonFSDetails
--CarnackiTestAddonFSDetails = CarnackiTestAddon:CreateFontString();
--CarnackiTestAddonFSDetails:SetFont("Fonts\\FRIZQT__.TTF", 16);
--CarnackiTestAddonFSDetails:SetDrawLayer("ARTWORK", 2)
--CarnackiTestAddonFSDetails:SetPoint("TOP", 0 , -40);
--CarnackiTestAddonFSDetails:SetTextColor(0,0,0);
--CarnackiTestAddonFSDetails:SetText("Testing fontstring");
--CarnackiTestAddonTexDetails:SetAllPoints(CarnackiTestAddonFSDetails);

--还是按照地点排序比较好，省去跑本的问题
--如果CD已使用，则放到最后
--获取player所有的坐骑信息，已经存在的从table中移除

local boss_table = {}
boss_table[1] = { "深岩之洲", "巨石之核", "普通", "琉璃石幼龙", 0.81, "岩皮", "repeat" }

boss_table[3] = { "嚎风峡湾", "乌特加德城堡", "英雄难度", "蓝色始祖幼龙", 1.69, "残忍的斯卡迪" }
boss_table[4] = { "奎尔丹纳斯岛", "魔导师平台", "普通", "迅捷白色陆行鸟", 3.92, "凯尔萨斯·逐日者" }
boss_table[5] = { "泰罗克森林", "塞泰克大厅", "英雄难度", "乌鸦之神", 1.79, "安苏", "day" }
boss_table[6] = { "北荆棘谷", "祖尔格拉布", "英雄难度", "迅捷祖利安黑豹", 0.99, "高阶祭司基尔娜拉" }
boss_table[7] = { "北荆棘谷", "祖尔格拉布", "英雄难度", "装甲拉扎什迅猛龙", 0.99, "血领主多基尔" }
boss_table[8] = { "东瘟疫之地", "斯坦索姆", "普通", "瑞文戴尔的死亡战马", 0.07, "奥里克斯·瑞文戴尔领主" }

boss_table[9] = { "虚空风暴", "风暴要塞", "普通", "奥的灰烬", 1.67, "凯尔萨斯·逐日者" }
boss_table[10] = { "尘泥沼泽", "奥妮克希亚的巢穴", "普通", "奥妮克希亚座龙", 0.28, "奥妮克希亚" }
boss_table[11] = { "风暴峭壁", "奥杜尔", "普通", "米米尔隆的头部", 1, "尤格萨隆" }
boss_table[12] = { "冰冠冰川", "冰冠堡垒", "25人英雄", "无敌", 1.19, "巫妖王" }
boss_table[13] = { "北风苔原", "永恒之眼", "普通", "蓝色幼龙", 1.05, "玛里苟斯" }
boss_table[14] = { "北风苔原", "永恒之眼", "普通", "碧蓝幼龙", 2.76, "玛里苟斯" }
boss_table[15] = { "龙眠神殿", "黑曜石圣殿", "25人", "暮光幼龙", 0, "萨塔里奥" }
boss_table[16] = { "龙眠神殿", "黑曜石圣殿", "10人", "黑色幼龙", 0, "萨塔里奥" }

boss_table[17] = { "幽魂之地", "祖阿曼", "普通", "阿曼尼斗熊", 100, "限时奖励", "100%掉落" }
boss_table[18] = { "时光之穴", "净化斯坦索姆", "普通", "青铜幼龙", 100, "永恒腐蚀者", "100%掉落" }

boss_table[19] = { "奥丹姆", "风神王座", "普通", "南风幼龙", 0.64, "奥拉基尔" }
boss_table[222] = { "奥丹姆", "旋云之巅", "普通", "北风幼龙", 0.83, "阿尔泰鲁斯", "repeat" }

boss_table[20] = { "海加尔山", "火焰之地", "10人/25人", "奥利瑟拉佐尔的烈焰之爪", 2.23, "奥利瑟拉佐尔" }
boss_table[21] = { "海加尔山", "火焰之地", "10人/25人", "纯血火鹰", 0.75, "拉格纳罗斯" }
boss_table[22] = { "时光之穴", "巨龙之魂", "英雄难度", "实验体12-B", 0.99, "奥卓克希昂" }
boss_table[23] = { "时光之穴", "巨龙之魂", "英雄难度", "炽炎幼龙", 2.74, "死亡之翼" }
boss_table[24] = { "时光之穴", "巨龙之魂", "英雄难度", "生命缚誓者的仆从", 2.74, "死亡之翼" }

boss_table[25] = { "昆莱山", "酒仙集", "野外", "神圣云端翔龙", 1, "怒之煞" }
boss_table[26] = { "昆莱山", "魔古山宝库", "英雄难度", "星光云端翔龙", 1, "伊拉贡" }

boss_table[27] = { "雷神岛", "雷电王座", "英雄难度", "赫立东的子嗣", 5, "赫利东" }
boss_table[28] = { "雷神岛", "雷电王座", "英雄难度", "季鹍之嗣", 1.87, "季鹍" }

boss_table[29] = { "锦绣谷", "决战奥格瑞玛", "史诗难度", "库卡隆战蝎", 6.25, "加尔鲁什·地狱咆哮" }

boss_table[30] = { "塔纳安丛林", "地狱火堡垒", "史诗难度", "魔钢歼灭者", 1, "阿克蒙德" }
boss_table[32] = { "塔纳安丛林", "黑石铸造厂", "史诗难度", "铁蹄毁灭者", 1, "黑手" }

boss_table[31] = { "逆风小径", "重返卡拉赞", "英雄难度", "午夜", 2, "猎手阿图门" }



--for k, v in pairs(boss_table) do
--    print(k,v)
--end

--local mountIDs = C_MountJournal.GetMountIDs()
--ChatFrame1:AddMessage(1111111)
--ChatFrame1:AddMessage(mountIDs)
--ChatFrame1:AddMessage(222222)



local collectedMounts = {}
local unCollectedRaidMounts = {}

local function calculateMounts()
    local mountIDs = C_MountJournal.GetMountIDs()

    for _, mID in pairs(mountIDs) do
        local name, spellID, icon, isActive, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected, mountID = C_MountJournal.GetMountInfoByID(mID)

        if isCollected then
            local creatureDisplayInfoID, description, source, isSelfMount, mountTypeID,
            uiModelSceneID, animID, spellVisualKitID, disablePlayerMountPreview = C_MountJournal.GetMountInfoExtraByID(mID)
            table.insert(collectedMounts, { mID, name, icon, source })
            --print(source)
            --print(index,mID, name)
        else
            if sourceType == 1 then
                local creatureDisplayInfoID, description, source, isSelfMount, mountTypeID,
                uiModelSceneID, animID, spellVisualKitID, disablePlayerMountPreview = C_MountJournal.GetMountInfoExtraByID(mID)
                table.insert(unCollectedRaidMounts, { mID, name, icon, source })
            end
        end
    end
end

calculateMounts()
local collectedCount, listCount, totalCount = GetNumCompanions("MOUNT"), C_MountJournal.GetNumMounts(), C_MountJournal.GetNumDisplayedMounts()



--
--for i = 1, collectedCount do
--    local name, spellID, icon, isActive, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected, mountID
--    --= C_MountJournal.GetDisplayedMountInfo(mountIDs[i])
--    = C_MountJournal.GetDisplayedMountInfo(i)
--
--    --ChatFrame1:AddMessage(i.."-"..mountID.."-"..name)
--    print(i,name,mountID)
--end





---create frame
--local frame_upper = nil
--local frame_lower = nil
--
--local function CreateMountListFrame()
--    frame_upper = CreateFrame("scrollframe", "MountScrollMain",UIParent)
--    frame_upper:SetPoint("bottom", UIParent, "bottom")
--    frame_upper:SetPoint("left", UIParent, "left", 3, 0)
--    frame_upper:SetPoint("right", UIParent, "right", -3, 0)
--    frame_upper:SetHeight(13)
--    frame_upper:SetFrameStrata("TOOLTIP")
--
--    frame_lower = CreateFrame("frame", "MountScrollChild", frame_upper)
--    frame_lower:SetHeight(25)
--    frame_lower:SetPoint("left", frame_upper, "left")
--    frame_lower:SetPoint("right", frame_upper, "right")
--    frame_upper:SetScrollChild(frame_lower)
--end
--
--CreateMountListFrame()


--local panel = CreateFrame("Frame")
--local category = Settings.RegisterCanvasLayoutCategory(panel, "My AddOn")
--Settings.RegisterAddOnCategory(category)


local function createScrollPanel(width, height, title, r, g, b)
    local panel = CreateFrame("Frame", nil, UIParent)
    panel:SetFrameStrata("MEDIUM");
    panel:SetWidth(width);
    panel:SetHeight(height);
    panel:SetPoint("CENTER");
    panel:SetMovable(true);
    panel:EnableMouse(true);

    local panelTexture = panel:CreateTexture();
    panelTexture:SetAllPoints();
    panelTexture:SetColorTexture(r, g, b);
    panelTexture:SetAlpha(1.0);

    panel.texture = panelTexture

    local panelScrollFrame = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    panelScrollFrame:SetPoint("TOPLEFT", 3, -4)
    panelScrollFrame:SetPoint("BOTTOMRIGHT", -27, 4)

    local panelScrollChild = CreateFrame("Frame")
    panelScrollFrame:SetScrollChild(panelScrollChild)
    panelScrollChild:SetWidth(panelScrollFrame:GetWidth() - 18)
    panelScrollChild:SetHeight(1)

    local collectedTitle = panelScrollChild:CreateFontString("ARTWORK", nil, "GameFontNormalLarge")
    collectedTitle:SetPoint("TOP")
    collectedTitle:SetText(title)

    return panel, panelScrollChild
end

local collectedPanel, collectedChild = createScrollPanel(800, 400, "已收集坐骑列表", 0.2, 0.3, 0.5)

local unCollectedPanel, unCollectedChild = createScrollPanel(800, 400, "未收集坐骑列表", 0.6, 0.2, 0.4)

collectedPanel:Hide()
unCollectedPanel:Hide()

local function updateScrollPanel(panel, content)
    --panel:Clear()
    for i, v in pairs(content) do
        local footer = panel:CreateFontString("ARTWORK", nil, "GameFontNormal")
        footer:SetPoint("TOP", 0, -i * 25)
        footer:SetWidth(panel:GetWidth() - 100);
        footer:SetJustifyH("LEFT");
        local icon = v[3] or 134468
        local name = v[2] or "unknown name"
        local mID = v[1] or "unknown id"
        local source = v[4] or "unknown source"
        source = string.gsub(source, "|n", " | ")
        --source = string.gsub(source,"r"," ")
        footer:SetWordWrap(false)
        footer:SetText(i .. ": |T" .. icon .. ":16|t" .. name .. "[" .. mID .. "]" .. "----" .. source)
    end
end

-----at last, I can create my own minimap icon
local minimap_icon_created = false

local minimap_db = {}

local function CreateMinimapIcon()
    if (minimap_icon_created) then
        return
    end

    minimap_icon_created = true

    local LDB = LibStub("LibDataBroker-1.1", true)
    local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)

    if LDB then
        local minimapIcon = LDB:NewDataObject("xiaosu", {
            type = "111 111",
            --icon = [[Interface\MINIMAP\MOVIERECORDINGICON]],
            icon = 134468,

            OnClick = function(self, button)
                local collectedShown = collectedPanel:IsShown();
                local uncollectedShown = unCollectedPanel:IsShown();

                if (button == "RightButton") then
                    ChatFrame1:AddMessage("...click left");
                    if collectedShown then
                        collectedPanel:Hide()
                    else
                        collectedPanel:Show()
                        updateScrollPanel(collectedChild, collectedMounts)
                        unCollectedPanel:Hide()
                    end
                elseif (button == "LeftButton") then
                    ChatFrame1:AddMessage(tostring(collectedMounts));
                    if uncollectedShown then
                        unCollectedPanel:Hide()
                    else
                        unCollectedPanel:Show()
                        updateScrollPanel(unCollectedChild, unCollectedRaidMounts)
                        collectedPanel:Hide()
                    end
                    ChatFrame1:AddMessage("...click right");
                end
            end,

            OnTooltipShow = function(tooltip)
                tooltip:AddLine("坐骑列表", 1, 1, 1)
                tooltip:AddLine("|cFFFF7700Left Click|r: 未收集列表.")
                tooltip:AddLine("|cFFFF7700Right Click|r: 已收集列表")
            end,
        })

        if (minimapIcon and not LDBIcon:IsRegistered("xiaosu")) then
            miniMapButtonPositionDB = miniMapButtonPositionDB or {}
            miniMapButtonPositionDB["mount"] = miniMapButtonPositionDB["mount"] or {}
            miniMapButtonPositionDB["mount"]["minimapPos"] = 206.3376812873
            miniMapButtonPositionDB["mount"]["hide"] = false
            LDBIcon:Register("xiaosu", minimapIcon, miniMapButtonPositionDB.mount)
        end
    end
end

CreateMinimapIcon()
