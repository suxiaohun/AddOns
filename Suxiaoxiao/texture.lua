local CarnackiTestAddon = CreateFrame("Frame", nil, UIParent);
local CarnackiTestAddonTexBG = CarnackiTestAddon:CreateTexture();
local CarnackiTestAddonTexTitle = CarnackiTestAddon:CreateTexture();
local CarnackiTestAddonTexDetails = CarnackiTestAddon:CreateTexture();

CarnackiTestAddon:SetFrameStrata("MEDIUM");
CarnackiTestAddon:SetWidth(600);
CarnackiTestAddon:SetHeight(400);
CarnackiTestAddon:SetPoint("CENTER");
CarnackiTestAddon:SetMovable(true);
CarnackiTestAddon:EnableMouse(true);

-- Main window background
--CarnackiTestAddon.texture = CarnackiTestAddonTexBG
CarnackiTestAddonTexBG:SetAllPoints();
CarnackiTestAddonTexBG:SetColorTexture(0.21,0.27,0.31);
CarnackiTestAddonTexBG:SetAlpha(1.0);

-- Title background
--CarnackiTestAddon.texture = CarnackiTestAddonTexTitle
CarnackiTestAddonTexTitle:SetAllPoints();
CarnackiTestAddonTexTitle:SetColorTexture(1,1,0.5);
CarnackiTestAddonTexTitle:SetAlpha(1.0);

-- Create the title fontstring
--CarnackiTestAddon.font = CarnackiTestAddonFSTitle
CarnackiTestAddonFSTitle = CarnackiTestAddon:CreateFontString();
CarnackiTestAddonFSTitle:SetFont("Fonts\\FRIZQT__.TTF", 24);
CarnackiTestAddonFSTitle:SetPoint("TOPLEFT", 0 , 0);
CarnackiTestAddonFSTitle:SetTextColor(0,0,0);
CarnackiTestAddonFSTitle:SetText("TEST");
CarnackiTestAddonTexTitle:SetAllPoints(CarnackiTestAddonFSTitle);

-- Add details background
--CarnackiTestAddon.texture = CarnackiTestAddonTexDetails
--CarnackiTestAddonTexDetails:SetAllPoints();
CarnackiTestAddonTexDetails:SetDrawLayer("ARTWORK", 1)
CarnackiTestAddonTexDetails:SetColorTexture(1.0,1.0,1.0);
--CarnackiTestAddonTexDetails:SetColorTexture(1.0,0.49,0.04);
CarnackiTestAddonTexDetails:SetAlpha(1.0);

-- Create the details fontstring
--CarnackiTestAddon.font = CarnackiTestAddonFSDetails
CarnackiTestAddonFSDetails = CarnackiTestAddon:CreateFontString();
CarnackiTestAddonFSDetails:SetFont("Fonts\\FRIZQT__.TTF", 16);
CarnackiTestAddonFSDetails:SetDrawLayer("ARTWORK", 2)
CarnackiTestAddonFSDetails:SetPoint("TOP", 0 , -40);
CarnackiTestAddonFSDetails:SetTextColor(0,0,0);
CarnackiTestAddonFSDetails:SetText("Testing fontstring");
CarnackiTestAddonTexDetails:SetAllPoints(CarnackiTestAddonFSDetails);