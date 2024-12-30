local config = dofile("config.lua")
local steps = config.steps

local dlg = Dialog{
    title = "Colour Modifier Step Configuration"
}

dlg:number{
    id = "hue_step",
    label = "Hue Step",
    text = tostring(steps.hue),
    decimals = 0
}

dlg:number{
    id = "saturation_step",
    label = "Saturation Step",
    text = tostring(steps.saturation),
    decimals = 0
}

dlg:number{
    id = "value_step",
    label = "Value Step",
    text = tostring(steps.value),
    decimals = 0
}

dlg:number{
    id = "alpha_step",
    label = "Alpha Step",
    text = tostring(steps.alpha),
    decimals = 0
}

dlg:button{
    text = "Save",
    onclick = function()
        local config_str = string.format([[
return {
    steps = {
        hue = %f,
        saturation = %f,
        value = %f,
        alpha = %f
    }
}]], dlg.data.hue_step,
     dlg.data.saturation_step,
     dlg.data.value_step,
     dlg.data.alpha_step)
     
        local file = io.open("config.lua", "w")
        if file then
            file:write(config_str)
            file:close()
            app.alert("Configuration saved!")
        else
            app.alert("Error saving configuration!")
        end
    end
}

dlg:show() 