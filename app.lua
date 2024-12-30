function updateColour(property, change)
    local config = dofile("config.lua")
    local steps = config.steps
    local color = app.fgColor
    local h, s, v, a = color.hue, color.saturation, color.value, color.alpha

    if property == "hue" then
        h = (h + (change * steps.hue)) % 360
    elseif property == "saturation" then
        s = math.min(1, math.max(0, s + (change * steps.saturation / 100)))
    elseif property == "value" then
        v = math.min(1, math.max(0, v + (change * steps.value / 100)))
    elseif property == "alpha" then
        a = math.min(255, math.max(0, a + (change * steps.alpha)))
    end

    app.fgColor = Color{hue=h, saturation=s, value=v, alpha=a}
end

return {
    updateColour = updateColour
}
