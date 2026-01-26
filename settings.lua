local sth = require("lib.settings-helper")

local settings = {
    {
        type = "bool-setting",
        name = "vanilla-oil-refinery-alt-skin",
        setting_type = "startup",
        default_value = true,
        order = "0a",
        localised_description = {"setting-description.vanilla-oil-refinery-alt-skin"},
    },
    sth.bool_setting("v_oil-refinery", "a"),
    sth.bool_setting("v_chem-plant", "a"),
}

if mods["Krastorio2"] or mods["Krastorio2-spaced-out"] then
  for _, s in pairs(sth.k2_settings()) do
    table.insert(settings, s)
  end
end

if mods["space-exploration"] then
  for _, s in pairs(sth.se_settings()) do
    table.insert(settings, s)
  end
end

if mods["spaced-out"] or mods["sei-cryogenic-plant"] then
  for _, s in pairs(sth.spaced_out_settings()) do
    table.insert(settings, s)
  end
end

data:extend(settings)
