local addonName, NS = ...

local Sprintf = NS.f.Sprintf

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

local collectedCount = GetNumCompanions("MOUNT");
local totalCount = C_MountJournal.GetNumMounts()
local numMounts = C_MountJournal.GetNumDisplayedMounts()

ChatFrame1:AddMessage('Hello, I have collected a total of ' .. collectedCount .. "/" .. numMounts .. "/" .. totalCount .. ' mounts.')
ChatFrame1:AddMessage(Sprintf("red", "11"));

ChatFrame1:AddMessage("--------------------aaaaaa-----")

local mountIDs = C_MountJournal.GetMountIDs()

ChatFrame1:AddMessage(tostring(mountIDs))

local collectedMounts = {}
local unCollectedRaidMounts = {}

for _, mID in pairs(mountIDs) do
    local name, spellID, icon, isActive, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected, mountID = C_MountJournal.GetMountInfoByID(mID)

    if isCollected then
        local creatureDisplayInfoID, description, source, isSelfMount, mountTypeID,
        uiModelSceneID, animID, spellVisualKitID, disablePlayerMountPreview
        = C_MountJournal.GetMountInfoExtraByID(mID)
        table.insert(collectedMounts, { mID, name, icon, source })
        --print(index,mID, name)
    else
        if sourceType == 1 then
            local creatureDisplayInfoID, description, source, isSelfMount, mountTypeID,
            uiModelSceneID, animID, spellVisualKitID, disablePlayerMountPreview
            = C_MountJournal.GetMountInfoExtraByID(mID)
            table.insert(unCollectedRaidMounts, { mID, name, icon, source })
        end
    end
end


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



---collected panel
local collectedPanel = CreateFrame("Frame", nil, UIParent)
collectedPanel:SetFrameStrata("MEDIUM");
collectedPanel:SetWidth(600);
collectedPanel:SetHeight(400);
collectedPanel:SetPoint("CENTER");
collectedPanel:SetMovable(true);
collectedPanel:EnableMouse(true);

local collectedPanelTexture = collectedPanel:CreateTexture();
collectedPanelTexture:SetAllPoints();
collectedPanelTexture:SetColorTexture(0.61, 0.27, 0.31);
collectedPanelTexture:SetAlpha(1.0);

collectedPanel.texture = collectedPanelTexture
--

-- Create the scrolling parent frame and size it to fit inside the texture
local collectedScrollFrame = CreateFrame("ScrollFrame", nil, collectedPanel, "UIPanelScrollFrameTemplate")
collectedScrollFrame:SetPoint("TOPLEFT", 3, -4)
collectedScrollFrame:SetPoint("BOTTOMRIGHT", -27, 4)

-- Create the scrolling child frame, set its width to fit, and give it an arbitrary minimum height (such as 1)
local collectedScrollChild = CreateFrame("Frame")
collectedScrollFrame:SetScrollChild(collectedScrollChild)
collectedScrollChild:SetWidth(collectedPanel:GetWidth() - 18)
collectedScrollChild:SetHeight(1)

-- Add widgets to the scrolling child frame as desired
local collectedTitle = collectedScrollChild:CreateFontString("ARTWORK", nil, "GameFontNormalLarge")
collectedTitle:SetPoint("TOP")
collectedTitle:SetText("已收集坐骑列表")

for i, v in pairs(collectedMounts) do
    local footer = collectedScrollChild:CreateFontString("ARTWORK", nil, "GameFontNormal")
    footer:SetPoint("TOP", 0, -i * 25)
    footer:SetWidth(500);
    footer:SetJustifyH("LEFT");
    footer:SetText(i .. ": |T" .. v[3] .. ":16|t" .. v[2] .. "[" .. v[1] .. "]" .. v[3] .. "----" .. v[4])
end

---uncollected panel
local uncollectedPanel = CreateFrame("Frame", nil, UIParent)
uncollectedPanel:SetFrameStrata("MEDIUM");
uncollectedPanel:SetWidth(600);
uncollectedPanel:SetHeight(400);
uncollectedPanel:SetPoint("CENTER");
uncollectedPanel:SetMovable(true);
uncollectedPanel:EnableMouse(true);

local uncollectedTexture = uncollectedPanel:CreateTexture();
uncollectedTexture:SetAllPoints();
uncollectedTexture:SetColorTexture(0.21, 0.27, 0.31);
uncollectedTexture:SetAlpha(1.0);

uncollectedPanel.texture = uncollectedTexture

local uncollectedScrollFrame = CreateFrame("ScrollFrame", nil, uncollectedPanel, "UIPanelScrollFrameTemplate")
uncollectedScrollFrame:SetPoint("TOPLEFT", 3, -4)
uncollectedScrollFrame:SetPoint("BOTTOMRIGHT", -27, 4)

-- Create the scrolling child frame, set its width to fit, and give it an arbitrary minimum height (such as 1)
local uncollectedScrollChild = CreateFrame("Frame")
uncollectedScrollFrame:SetScrollChild(uncollectedScrollChild)
uncollectedScrollChild:SetWidth(uncollectedPanel:GetWidth() - 18)
uncollectedScrollChild:SetHeight(1)

-- Add widgets to the scrolling child frame as desired
local uncollectedTitle = uncollectedScrollChild:CreateFontString("ARTWORK", nil, "GameFontNormalLarge")
uncollectedTitle:SetPoint("TOP")
uncollectedTitle:SetText("未收集坐骑列表")

for i, v in pairs(unCollectedRaidMounts) do
    local footer = uncollectedScrollChild:CreateFontString("ARTWORK", nil, "GameFontNormal")
    footer:SetPoint("TOP", 0, -i * 25)
    footer:SetWidth(500);
    footer:SetJustifyH("LEFT");
    local source = v[4] or "未知"
    footer:SetText(i .. ": |T" .. v[3] .. ":16|t" .. v[2] .. "[" .. v[1] .. "]"  .. "----" .. source)
end

---todo 将头像图标也加入展示的文字信息？

--local footer = scrollChild:CreateFontString("ARTWORK", nil, "GameFontNormal")
--footer:SetPoint("TOP", 0, -5000)
--footer:SetText("This is 5000 below the top, so the scrollChild automatically expanded.")


--
--
--
--local frameHolder;
--
---- create the frame that will hold all other frames/objects:
--frameHolder = frameHolder or CreateFrame("Frame", nil, UIParent); -- re-size this to whatever size you wish your ScrollFrame to be, at this point
--
--local self = frameHolder
--
---- now create the template Scroll Frame (this frame must be given a name so that it can be looked up via the _G function (you'll see why later on in the code)
--self.scrollframe = self.scrollframe or CreateFrame("ScrollFrame", "ANewScrollFrame", self, "UIPanelScrollFrameTemplate");
--
---- create the standard frame which will eventually become the Scroll Frame's scrollchild
---- importantly, each Scroll Frame can have only ONE scrollchild
--self.scrollchild = self.scrollchild or CreateFrame("Frame"); -- not sure what happens if you do, but to be safe, don't parent this yet (or do anything with it)
--
---- define the scrollframe's objects/elements:
--local scrollbarName = self.scrollframe:GetName()
--self.scrollbar = _G[scrollbarName.."ScrollBar"];
--self.scrollupbutton = _G[scrollbarName.."ScrollBarScrollUpButton"];
--self.scrolldownbutton = _G[scrollbarName.."ScrollBarScrollDownButton"];
--
---- all of these objects will need to be re-anchored (if not, they appear outside the frame and about 30 pixels too high)
--self.scrollupbutton:ClearAllPoints();
--self.scrollupbutton:SetPoint("TOPRIGHT", self.scrollframe, "TOPRIGHT", -2, -2);
--
--self.scrolldownbutton:ClearAllPoints();
--self.scrolldownbutton:SetPoint("BOTTOMRIGHT", self.scrollframe, "BOTTOMRIGHT", -2, 2);
--
--self.scrollbar:ClearAllPoints();
--self.scrollbar:SetPoint("TOP", self.scrollupbutton, "BOTTOM", 0, -2);
--self.scrollbar:SetPoint("BOTTOM", self.scrolldownbutton, "TOP", 0, 2);
--
---- now officially set the scrollchild as your Scroll Frame's scrollchild (this also parents self.scrollchild to self.scrollframe)
---- IT IS IMPORTANT TO ENSURE THAT YOU SET THE SCROLLCHILD'S SIZE AFTER REGISTERING IT AS A SCROLLCHILD:
--self.scrollframe:SetScrollChild(self.scrollchild);
--
---- set self.scrollframe points to the first frame that you created (in this case, self)
--self.scrollframe:SetAllPoints(self);
--
---- now that SetScrollChild has been defined, you are safe to define your scrollchild's size. Would make sense to make it's height > scrollframe's height,
---- otherwise there's no point having a scrollframe!
---- note: you may need to define your scrollchild's height later on by calculating the combined height of the content that the scrollchild's child holds.
---- (see the bit below about showing content).
--self.scrollchild:SetSize(self.scrollframe:GetWidth(), ( self.scrollframe:GetHeight() * 2 ));
--
--
---- THE SCROLLFRAME IS COMPLETE AT THIS POINT.  THE CODE BELOW DEMONSTRATES HOW TO SHOW DATA ON IT.
--
--
---- you need yet another frame which will be used to parent your widgets etc to.  This is the frame which will actually be seen within the Scroll Frame
---- It is parented to the scrollchild.  I like to think of scrollchild as a sort of 'pin-board' that you can 'pin' a piece of paper to (or take it back off)
--self.moduleoptions = self.moduleoptions or CreateFrame("Frame", nil, self.scrollchild);
--self.moduleoptions:SetAllPoints(self.scrollchild);

-- a good way to immediately demonstrate the new scrollframe in action is to do the following...

-- create a fontstring or a texture or something like that, then place it at the bottom of the frame that holds your info (in this case self.moduleoptions)
--self.moduleoptions.fontstring = self.moduleoptions:CreateFontString(nil, "OVERLAY", "GameTooltipText")
--self.moduleoptions.fontstring:SetText("This is a test.");
--self.moduleoptions.fontstring:SetPoint("BOTTOMLEFT", self.moduleoptions, "BOTTOMLEFT", 20, 60);

-- you should now need to scroll down to see the text "This is a test."





--local function CreateFullBorder (name, parent)
--    local border = CreateFrame("Frame", name, parent)
--    border:SetAllPoints()
--    border:SetIgnoreParentScale(true)
--    border:SetFrameLevel(border:GetParent():GetFrameLevel())
--    border.Textures = {}
--
--    local left = border:CreateTexture("$parentLeft", "BACKGROUND", nil, -8)
--    --left:SetDrawLayer("BACKGROUND", -8)
--    left:SetColorTexture(1, 1, 1, 1)
--    left:SetWidth(1.0)
--    left:SetPoint("TOPRIGHT", border, "TOPLEFT", 0, 1.0)
--    left:SetPoint("BOTTOMRIGHT", border, "BOTTOMLEFT", 0, -1.0)
--    border.Left = left
--
--    local right = border:CreateTexture("$parentRight", "BACKGROUND", nil, -8)
--    --right:SetDrawLayer("BACKGROUND", -8)
--    right:SetColorTexture(1, 1, 1, 1)
--    right:SetWidth(1.0)
--    right:SetPoint("TOPLEFT", border, "TOPRIGHT", 0, 1.0)
--    right:SetPoint("BOTTOMLEFT", border, "BOTTOMRIGHT", 0, -1.0)
--    border.Right = right
--
--    local bottom = border:CreateTexture("$parentBottom", "BACKGROUND", nil, -8)
--    --bottom:SetDrawLayer("BACKGROUND", -8)
--    bottom:SetColorTexture(1, 1, 1, 1)
--    bottom:SetHeight(1.0)
--    bottom:SetPoint("TOPLEFT", border, "BOTTOMLEFT", 0, 0)
--    bottom:SetPoint("TOPRIGHT", border, "BOTTOMRIGHT", 0, 0)
--    border.Bottom = bottom
--
--    local top = border:CreateTexture("$parentTop", "BACKGROUND", nil, -8)
--    --top:SetDrawLayer("BACKGROUND", -8)
--    top:SetColorTexture(1, 1, 1, 1)
--    top:SetHeight(1.0)
--    top:SetPoint("BOTTOMLEFT", border, "TOPLEFT", 0, 0)
--    top:SetPoint("BOTTOMRIGHT", border, "TOPRIGHT", 0, 0)
--    border.Top = top
--
--    return border
--end
--
--local CONST_ROWFRAME_ALPHA = 0.975036
--local parseRowFrameAlpha = function(value)
--    return math.min(value, CONST_ROWFRAME_ALPHA)
--end
--
--local baseframe_strata = "LOW"
--local DEFAULT_SKIN = [[Interface\AddOns\Details\images\skins\classic_skin]]
--local COORDS_SLIDER_TOP = {0.00146484375, 0.03076171875, 0.00244140625, 0.03173828125} -- 1 2 32 33 -ok
--local COORDS_SLIDER_DOWN = {0.00146484375, 0.03076171875, 0.10986328125, 0.13916015625} -- 1 112 32 143 -ok
--local COORDS_SLIDER_MIDDLE = {0.00146484375, 0.03076171875, 0.03955078125, 0.10009765625} -- 1 40 32 103 -ok
--local COORDS_STRETCH = {0.0009765625, 0.03125, 0.2138671875, 0.228515625} -- 1 32 219 234
--
--local unpack = unpack
--
--local function CreateMountDropListFrame()
--
--    -- main frames -----------------------------------------------------------------------------------------------------------------------------------------------
--
--    --baseframe is the lowest frame in the window architecture
--    local baseframe = CreateFrame("scrollframe", "MountDropListBaseFrame", UIParent,"BackdropTemplate")
--    baseframe:SetMovable(true)
--    baseframe:SetResizable(true)
--    baseframe:SetUserPlaced(false)
--    baseframe:SetDontSavePosition(true)
--    baseframe:SetFrameStrata(baseframe_strata)
--    baseframe:SetFrameLevel(2)
--    --baseframe.instance = instancia
--
--    local baseframeBorder = CreateFullBorder(baseframe:GetName() .. "BaseBorder", baseframe)
--    baseframeBorder:SetBorderSizes(1, 1, 1, 1)
--    baseframeBorder:UpdateSizes()
--    baseframeBorder:SetVertexColor(0, 0, 0, 1)
--    baseframe.border = baseframeBorder
--    baseframe.border:Hide()
--
--    local titleBar = CreateFrame("frame", baseframe:GetName() .. "TitleBar", baseframe, "BackdropTemplate")
--    titleBar:SetPoint("bottomleft", baseframe, "topleft", 0, 0)
--    titleBar:SetPoint("bottomright", baseframe, "topright", 0, 0)
--    titleBar:SetHeight(16)
--    titleBar:EnableMouse(false)
--    baseframe.titleBar = titleBar
--
--    titleBar.texture = titleBar:CreateTexture("$parentTexture", "artwork")
--    titleBar.texture:SetAllPoints()
--    titleBar.texture:SetTexture([[Interface\AddOns\Details\images\bar_serenity]])
--    titleBar.texture:SetVertexColor(0, 0, 0, 0)
--
--    --a background frame that anchors in the topleft of the title bar and bottom right of the baseframe
--    --this frame does not attack to statusbar (yet)
--    local fullWindowFrame = CreateFrame("frame", baseframe:GetName() .. "FullWindowFrame", baseframe, "BackdropTemplate")
--    fullWindowFrame:EnableMouse(false)
--    fullWindowFrame:SetPoint("topleft", titleBar, "topleft", 0, 0)
--    fullWindowFrame:SetPoint("bottomright", baseframe, "bottomright", 0, 0)
--    baseframe.fullWindowFrame = fullWindowFrame
--
--    local fullWindowBorder = CreateFullBorder(fullWindowFrame:GetName() .. "Border", fullWindowFrame)
--    fullWindowBorder:SetBorderSizes(1, 1, 1, 1)
--    fullWindowBorder:UpdateSizes()
--    fullWindowBorder:SetVertexColor(0, 0, 0, 1)
--    fullWindowFrame.border = fullWindowBorder
--    fullWindowFrame.border:Hide()
--
--    --background holds the wallpaper, alert strings ans textures, have setallpoints on baseframe
--    --backgrounddisplay is a scrollschild of backgroundframe, hence its children won't show outside its canvas
--    local backgroundframe =  CreateFrame("scrollframe", "MountDropList_WindowFrame", baseframe) --window frame
--    local backgrounddisplay = CreateFrame("frame", "MountDropList_GumpFrame", backgroundframe,"BackdropTemplate") --gump frame
--    backgroundframe:SetFrameLevel(3)
--    backgrounddisplay:SetFrameLevel(3)
--    --backgroundframe.instance = instancia
--    --backgrounddisplay.instance = instancia
--    --instancia.windowBackgroundDisplay = backgrounddisplay
--
--    --row frame is the parent of rows, it have setallpoints on baseframe
--    local rowframe = CreateFrame("frame", "MountDropListRowFrame", UIParent) --row frame
--    rowframe:SetAllPoints(baseframe)
--    rowframe:SetFrameStrata(baseframe_strata)
--    rowframe:SetFrameLevel(3)
--    rowframe:EnableMouse(false)
--    --instancia.rowframe = rowframe
--
--    function rowframe:SetFrameAlpha(value)
--        local value = parseRowFrameAlpha(value)
--        self:SetAlpha(value)
--    end
--
--    --right click bookmark
--    local switchbutton = CreateFrame("button", "MountDropList_SwitchButtonFrame" ..  ID, UIParent)
--    switchbutton:SetAllPoints(baseframe)
--    switchbutton:SetFrameStrata(baseframe_strata)
--    switchbutton:SetFrameLevel(4)
--    --instancia.windowSwitchButton = switchbutton
--
--    --avoid mouse hover over a high window when the menu is open for a lower instance.
--    local anti_menu_overlap = CreateFrame("frame", "MountDropList_WindowFrameAntiMenuOverlap" .. ID, UIParent)
--    anti_menu_overlap:SetSize(100, 13)
--    anti_menu_overlap:SetFrameStrata("DIALOG")
--    anti_menu_overlap:EnableMouse(true)
--    anti_menu_overlap:Hide()
--    baseframe.anti_menu_overlap = anti_menu_overlap
--
--    --floating frame is an anchor for widgets which should be overlaying the window
--    local floatingframe = CreateFrame("frame", "MountDropListBorderHolder", baseframe)
--    floatingframe:SetFrameLevel(baseframe:GetFrameLevel()+7)
--    --instancia.floatingframe = floatingframe
--
--    -- scroll bar -----------------------------------------------------------------------------------------------------------------------------------------------
--    --create the scrollbar, almost not used.
--
--    local scrollbar = CreateFrame("slider", "MountDropList_ScrollBar", backgrounddisplay) --scroll
--
--    --scroll image-node up
--    baseframe.scroll_up = backgrounddisplay:CreateTexture(nil, "background")
--    baseframe.scroll_up:SetPoint("topleft", backgrounddisplay, "topright", 0, 0)
--    baseframe.scroll_up:SetTexture(DEFAULT_SKIN)
--    baseframe.scroll_up:SetTexCoord(unpack(COORDS_SLIDER_TOP))
--    baseframe.scroll_up:SetWidth(32)
--    baseframe.scroll_up:SetHeight(32)
--
--    --scroll image-node down
--    baseframe.scroll_down = backgrounddisplay:CreateTexture(nil, "background")
--    baseframe.scroll_down:SetPoint("bottomleft", backgrounddisplay, "bottomright", 0, 0)
--    baseframe.scroll_down:SetTexture(DEFAULT_SKIN)
--    baseframe.scroll_down:SetTexCoord(unpack(COORDS_SLIDER_DOWN))
--    baseframe.scroll_down:SetWidth(32)
--    baseframe.scroll_down:SetHeight(32)
--
--    --scroll image-node middle
--    baseframe.scroll_middle = backgrounddisplay:CreateTexture(nil, "background")
--    baseframe.scroll_middle:SetPoint("top", baseframe.scroll_up, "bottom", 0, 8)
--    baseframe.scroll_middle:SetPoint("bottom", baseframe.scroll_down, "top", 0, -11)
--    baseframe.scroll_middle:SetTexture(DEFAULT_SKIN)
--    baseframe.scroll_middle:SetTexCoord(unpack(COORDS_SLIDER_MIDDLE))
--    baseframe.scroll_middle:SetWidth(32)
--    baseframe.scroll_middle:SetHeight(64)
--
--    --scroll widgets
--    baseframe.button_up = CreateFrame("button", "MountDropListScrollUp", backgrounddisplay)
--    baseframe.button_down = CreateFrame("button", "MountDropListScrollDown", backgrounddisplay)
--
--    baseframe.button_up:SetWidth(29)
--    baseframe.button_up:SetHeight(32)
--    baseframe.button_up:SetNormalTexture([[Interface\BUTTONS\UI-ScrollBar-ScrollUpButton-Up]])
--    baseframe.button_up:SetPushedTexture([[Interface\BUTTONS\UI-ScrollBar-ScrollUpButton-Down]])
--    baseframe.button_up:SetDisabledTexture([[Interface\BUTTONS\UI-ScrollBar-ScrollUpButton-Disabled]])
--    baseframe.button_up:Disable()
--
--    baseframe.button_down:SetWidth(29)
--    baseframe.button_down:SetHeight(32)
--    baseframe.button_down:SetNormalTexture([[Interface\BUTTONS\UI-ScrollBar-ScrollDownButton-Up]])
--    baseframe.button_down:SetPushedTexture([[Interface\BUTTONS\UI-ScrollBar-ScrollDownButton-Down]])
--    baseframe.button_down:SetDisabledTexture([[Interface\BUTTONS\UI-ScrollBar-ScrollDownButton-Disabled]])
--    baseframe.button_down:Disable()
--
--    baseframe.button_up:SetPoint("topright", baseframe.scroll_up, "topright", -4, 3)
--    baseframe.button_down:SetPoint("bottomright", baseframe.scroll_down, "bottomright", -4, -6)
--
--    scrollbar:SetPoint("top", baseframe.button_up, "bottom", 0, 12)
--    scrollbar:SetPoint("bottom", baseframe.button_down, "top", 0, -12)
--    scrollbar:SetPoint("left", backgrounddisplay, "right", 3, 0)
--    scrollbar:Show()
--
--    --config set
--    scrollbar:SetOrientation("VERTICAL")
--    scrollbar.scrollMax = 0
--    scrollbar:SetMinMaxValues(0, 0)
--    scrollbar:SetValue(0)
--    scrollbar.ultimo = 0
--
--    --thumb
--    scrollbar.thumb = scrollbar:CreateTexture(nil, "overlay")
--    scrollbar.thumb:SetTexture([[Interface\Buttons\UI-ScrollBar-Knob]])
--    scrollbar.thumb:SetSize(29, 30)
--    scrollbar:SetThumbTexture (scrollbar.thumb)
--
--    --scripts
--    --button_down_scripts (baseframe, backgrounddisplay, instancia, scrollbar)
--    --button_up_scripts (baseframe, backgrounddisplay, instancia, scrollbar)
--
--    -- stretch button -----------------------------------------------------------------------------------------------------------------------------------------------
--
--    baseframe.button_stretch = CreateFrame("button", "MountDropListButtonStretch", baseframe)
--    baseframe.button_stretch:SetPoint("bottom", baseframe, "top", 0, 20)
--    baseframe.button_stretch:SetPoint("right", baseframe, "right", -27, 0)
--    baseframe.button_stretch:SetFrameLevel(1)
--
--    local stretch_texture = baseframe.button_stretch:CreateTexture(nil, "overlay")
--    stretch_texture:SetTexture(DEFAULT_SKIN)
--    stretch_texture:SetTexCoord(unpack(COORDS_STRETCH))
--    stretch_texture:SetWidth(32)
--    stretch_texture:SetHeight(16)
--    stretch_texture:SetAllPoints(baseframe.button_stretch)
--    baseframe.button_stretch.texture = stretch_texture
--
--    baseframe.button_stretch:SetWidth(32)
--    baseframe.button_stretch:SetHeight(16)
--
--    baseframe.button_stretch:Show()
--
--end
--
--CreateMountDropListFrame()


collectedPanel:Hide()
uncollectedPanel:Hide()

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
                local uncollectedShown = uncollectedPanel:IsShown();

                if (button == "RightButton") then
                    ChatFrame1:AddMessage("...click left");
                    ChatFrame1:AddMessage(tostring(collectedShown));
                    if collectedShown then
                        collectedPanel:Hide()
                    else
                        collectedPanel:Show()
                        uncollectedPanel:Hide()
                    end
                elseif (button == "LeftButton") then
                    ChatFrame1:AddMessage(tostring(uncollectedShown));
                    if uncollectedShown then
                        uncollectedPanel:Hide()
                    else
                        uncollectedPanel:Show()
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
            LDBIcon:Register("xiaosu", minimapIcon, minimap_db)
        end
    end
end

CreateMinimapIcon()





--local button = CreateButton("test",nil)
--ChatFrame1:AddMessage(button:GetText());
--button:Show()
