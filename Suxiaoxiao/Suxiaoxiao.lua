MyAddOn_SavedVars = {}

---canvas

local frame = CreateFrame("Frame")
local background = frame:CreateTexture()
background:SetAllPoints(frame)
background:SetColorTexture(1, 0, 1, 0)

--local myCheckButton = CreateFrame("CheckButton", "MyCheckButton", frame)
--myCheckButton:SetPoint("CENTER")
--myCheckButton:SetText("CheckBox Name")
--myCheckButton.tooltip = "This is where you place MouseOver Text."
--myCheckButton:HookScript("OnClick", function()
--    --do stuff
--end)

local canvasCategory = Settings.RegisterCanvasLayoutCategory(frame, "My Canvas AddOn")

Settings.RegisterAddOnCategory(canvasCategory)

---canvas

---vertical


local category = Settings.RegisterVerticalLayoutCategory("My Vertical AddOn")

do
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "crit", MyAddOn_SavedVars, type(false), "暴击", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "haste", MyAddOn_SavedVars, type(false), "急速", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "versatility", MyAddOn_SavedVars, type(false), "全能", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "mastery", MyAddOn_SavedVars, type(false), "精通", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "lifeSteal", MyAddOn_SavedVars, type(false), "吸血", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "dodge", MyAddOn_SavedVars, type(false), "躲闪", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "parry", MyAddOn_SavedVars, type(false), "招架", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "avoid", MyAddOn_SavedVars, type(false), "闪避", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "attackSpeed", MyAddOn_SavedVars, type(false), "攻速", false), "This is a tooltip for the checkbox.")
    Settings.CreateCheckBox(category, Settings.RegisterProxySetting(category, "moveSpeed", MyAddOn_SavedVars, type(false), "移速", false), "This is a tooltip for the checkbox.")

end

--do
--    local variable = "slider"
--    local name = "Test Slider"
--    local tooltip = "This is a tooltip for the slider."
--    local defaultValue = 180
--    local minValue = 90
--    local maxValue = 360
--    local step = 10
--
--    local setting = Settings.RegisterProxySetting(category, variable, MyAddOn_SavedVars, type(defaultValue), name, defaultValue)
--    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
--    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
--    Settings.CreateSlider(category, setting, options, tooltip)
--end

--do
--    local variable = "selection"
--    local defaultValue = 2  -- Corresponds to "Option 2" below.
--    local name = "Test Dropdown"
--    local tooltip = "This is a tooltip for the dropdown."
--
--    local function GetOptions()
--        local container = Settings.CreateControlTextContainer()
--        container:Add(1, "Option 1")
--        container:Add(2, "Option 2")
--        container:Add(3, "Option 3")
--        return container:GetData()
--    end
--
--    local setting = Settings.RegisterProxySetting(category, variable, MyAddOn_SavedVars, type(defaultValue), name, defaultValue)
--    Settings.CreateDropDown(category, setting, GetOptions, tooltip)
--end

Settings.RegisterAddOnCategory(category)

---vertical
