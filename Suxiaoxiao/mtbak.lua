
--local addonName,NS = ...
--
--local Sprintf = NS.f.Sprintf


local CarnackiTestAddon = CreateFrame("Frame", nil, UIParent);
local CarnackiTestAddonTexBG = CarnackiTestAddon:CreateTexture();
--local CarnackiTestAddonTexTitle = CarnackiTestAddon:CreateTexture();
--local CarnackiTestAddonTexDetails = CarnackiTestAddon:CreateTexture();

CarnackiTestAddon:SetFrameStrata("MEDIUM");
CarnackiTestAddon:SetWidth(600);
CarnackiTestAddon:SetHeight(400);
CarnackiTestAddon:SetPoint("CENTER");
CarnackiTestAddon:SetMovable(true);
CarnackiTestAddon:EnableMouse(true);

-- Main window background
CarnackiTestAddon.texture = CarnackiTestAddonTexBG
CarnackiTestAddonTexBG:SetAllPoints();
CarnackiTestAddonTexBG:SetColorTexture(0.21,0.27,0.31);
CarnackiTestAddonTexBG:SetAlpha(1.0);
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

local mountIDs = C_MountJournal.GetMountIDs()
ChatFrame1:AddMessage(1111111)
ChatFrame1:AddMessage(mountIDs)
ChatFrame1:AddMessage(222222)


return


--先从列表中移除当前角色已经存在的坐骑
for i = 1, GetNumCompanions("MOUNT") do
    local name, spellID, icon, isActive, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected, mountID = C_MountJournal.GetDisplayedMountInfo(i)
    -- Assign local vars name and typeID from GetCompanionInfo(). Create unnasigned local var typeString.
    --typeID = bit.band(3, typeID)
    -- Bitwise AND operator sets typeID to 0 for water, 1 for ground and 3 for flying mounts.
    --typeString = typeID == 0 and "Water" or typeID == 1 and "Ground" or "Flying"
    -- Nested and..or operator to set typeString according to typeID.
    --print(name, typeString)
    --print(name)
    ChatFrame1:AddMessage(i.."-"..mountID.."-"..name)
    if boss_table[mountID] then
        boss_table[mountID] = nil
    end
end

--排序输出列表
--已经CD的移动到最后，如何统计已经击杀的呢？第二天或第二周还要重置
--未CD的按照地理位置排序
local location
local raid
local list = ""

local i = 0
for _,v in pairs(boss_table) do
    local location_texture = CarnackiTestAddon:CreateTexture();
    location_texture:SetAllPoints();
    --location_texture:SetPoint("TOPLEFT", 0 , i);
    location_texture:SetColorTexture(1,1,0.5);
    location_texture:SetAlpha(1.0);



    -- Create the title fontstring
    --CarnackiTestAddon.font = CarnackiTestAddonFSTitle
    local location_text = CarnackiTestAddon:CreateFontString();
    location_text:SetFont("Fonts\\FRIZQT__.TTF", 24);
    location_text:SetPoint("TOP", 0 , -10);
    location_text:SetTextColor(0,0,0);
    location_text:SetText(v[1]);
    location_text:SetAllPoints(location_texture);
    i=i+10
end

--for k, v in pairs(boss_table) do
--
--    if location and location == v[1] then
--
--    else
--        location = v[1]
--        --print.red.bold.underline(location)
--        list = list .. Sprintf("underline") .. (Sprintf("red", location)) .. Sprintf("clear") .. "\n"
--    end
--    if raid and raid == v[2] then
--
--    else
--        raid = v[2]
--        --print.bold.green("    " .. raid .. "(" .. v[3] .. ")")
--        list = list .. Sprintf("bold") .. (Sprintf("green", "    " .. raid .. "(" .. v[3] .. ")")) .. "\n"
--    end
--    --print.pink("        [" .. v[4] .. "]\027[93m-->[" .. v[5] .. "%]")
--    list = list .. Sprintf("pink", "        [" .. v[4] .. "]\027[93m-->[" .. v[5] .. "%]") .. "\n"
--    --print.red.highlight(v[2].."-->"..v[3].."-->"..v[1])
--end

--local fruits = { { "banana", "aa", "cc" }, "orange", "apple" }
--for k, v in ipairs(fruits) do
--    print(k, v)
--end

--print(list)

local frame = CreateFrame("Frame", nil, UIParent)
frame:SetHeight(70)
frame:SetWidth(270)
frame:SetPoint("TOPLEFT", UIParent, "CENTER", 10, 120)

local fs = frame:CreateFontString()
fs:SetPoint("TOPLEFT", frame, "TOPLEFT", x, y)
fs:SetFontObject(GameFontNormal)
fs:SetFont("Fonts\\ARHei.ttf", 20, "OUTLINE, MONOCHROME")
fs:SetText(list)



--function X_OnDeath(pUnit, Event)
--    local plr = pUnit:GetClosestPlayer()
--    if plr ~= nil then
--        local name = plr:GetName()
--        local world = GetPlayersInWorld() -- I don't know if this needs pUnit in front of it.
--        for a, plrs in pairs(world) do
--            plrs:SendBroadcastMessage("This awesome boss of epix was just killed by  "..name.."!")
--            plrs:SendAreaTriggerMessage("This awesome boss of epix was just killed by  "..name.."!")
--        end
--    end
--end
--
--RegisterUnitEvent(npcid, 4, "X_OnDeath")

