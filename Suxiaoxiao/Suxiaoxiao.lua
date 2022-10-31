Xiao_SavedVars = {}

local category = Settings.RegisterVerticalLayoutCategory("Suxiaoxiao AddOn")

do
    local variable = "toggle"
    local name = "Test Checkbox"
    local tooltip = "This is a tooltip for the checkbox."
    local defaultValue = false

    local setting = Settings.RegisterProxySetting(category, variable, Xiao_SavedVars, type(defaultValue), name, defaultValue)
    Settings.CreateCheckBox(category, setting, tooltip)
end

do
    local variable = "slider"
    local name = "Test Slider"
    local tooltip = "This is a tooltip for the slider."
    local defaultValue = 180
    local minValue = 90
    local maxValue = 360
    local step = 10

    local setting = Settings.RegisterProxySetting(category, variable, Xiao_SavedVars, type(defaultValue), name, defaultValue)
    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
    Settings.CreateSlider(category, setting, options, tooltip)
end

do
    local variable = "selection"
    local defaultValue = 2  -- Corresponds to "Option 2" below.
    local name = "Test Dropdown"
    local tooltip = "This is a tooltip for the dropdown."

    local function GetOptions()
        local container = Settings.CreateDropDownTextContainer()
        container:Add(1, "Option 1")
        container:Add(2, "Option 2")
        container:Add(3, "Option 3")
        return container:GetData()
    end

    local setting = Settings.RegisterProxySetting(category, variable, Xiao_SavedVars, type(defaultValue), name, defaultValue)
    Settings.CreateDropDown(category, setting, GetOptions, tooltip)
end

Settings.RegisterAddOnCategory(category)