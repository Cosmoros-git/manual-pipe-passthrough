local M = {}

local function bool_setting(name, order)
  return {
    type = "bool-setting",
    name = name,
    setting_type = "startup",
    default_value = true,
    order = order
  }
end

function M.bool_setting(name, order)
  return {
    type = "bool-setting",
    name = name,
    setting_type = "startup",
    default_value = true,
    order = order
  }
end

function M.load_if_enabled(setting_name, path)
  if settings.startup[setting_name]
     and settings.startup[setting_name].value then
    require(path)
  end
end

function M.k2_settings()
-- K2 buildings (kr_ prefix)
  return {
  bool_setting("kr-advanced-furnace", "kr"),
  bool_setting("kr-advanced-chemical-plant", "kr"),
  bool_setting("kr-matter-associator", "kr"),
  bool_setting("kr-fuel-refinery", "kr"),
  bool_setting("kr-atmospheric-condenser", "kr"),
  bool_setting("kr-quantum-computer", "kr"),
  bool_setting("kr-matter-plant", "kr"),
  bool_setting("kr-electrolysis-plant", "kr"),
  }
end

function M.se_settings()
-- SE buildings (se_ prefix)
  return {
  bool_setting("se-fuel-refinery", "se"),
  bool_setting("se-growth-biochem-lab", "se"),
  bool_setting("se-hypercooler", "se"),
  bool_setting("se-thermodyn-radiation-laser-plasma-electromag-labs", "se"),
  bool_setting("se-partice-acc-col-fab", "se"),
  bool_setting("se-decontamination-lifesupport-facility", "se"),
  bool_setting("se-space-manufactory", "se"),
  bool_setting("se-genetics-laboratory", "se"),
  bool_setting("se-recycler-pulveriser-mechanical", "se")
  }
end

function M.spaced_out_settings()
  return {
  bool_setting("sei_cryogenic-plant", "sei"),
  }
end

return M
