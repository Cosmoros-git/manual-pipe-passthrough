local loader = require("lib.settings-helper") -- Helps making this less of a mess.

-- VANILLA
loader.load_if_enabled("v_oil-refinery", "prototypes.buildings.vanilla.oil-refinery")
loader.load_if_enabled("v_chem-plant",  "prototypes.buildings.vanilla.chem-plant")

-- SPACED OUT
if mods["spaced-out"] or mods["sei-cryogenic-plant"] then
  loader.load_if_enabled("sei_cryogenic-plant",
    "prototypes.buildings.spaced-out.cryogenic-plant")
end

-- KRASTORIO 2
K2_PIPE_PICTURES_MOD =
    mods["Krastorio2-spaced-out"] and "__Krastorio2-spaced-out__"
    or mods["Krastorio2"] and "__Krastorio2__"
    or nil

local k2_loc = "prototypes.buildings.k2."
if K2_PIPE_PICTURES_MOD then
  loader.load_if_enabled("kr-advanced-furnace",        k2_loc.."kr-advanced-furnace")
  loader.load_if_enabled("kr-advanced-chemical-plant", k2_loc.."kr-advanced-chemical-plant")
  loader.load_if_enabled("kr-matter-associator",       k2_loc.."kr-matter-associator")
  loader.load_if_enabled("kr-fuel-refinery",           k2_loc.."kr-fuel-refinery")
  loader.load_if_enabled("kr-atmospheric-condenser",   k2_loc.."kr-atmospheric-condenser")
  loader.load_if_enabled("kr-quantum-computer",        k2_loc.."kr-quantum-computer")
  loader.load_if_enabled("kr-matter-plant",            k2_loc.."kr-matter-plant")
  loader.load_if_enabled("kr-electrolysis-plant",      k2_loc.."kr-electrolysis-plant")
end

-- SPACE EXPLORATION
local se_loc = "prototypes.buildings.space-exploration."
if mods["space-exploration"] then
  loader.load_if_enabled("se-fuel-refinery",                                      se_loc.."se-fuel-refinery")
  loader.load_if_enabled("se-growth-biochem-lab",                                 se_loc.."se-growth-biochem-lab")
  loader.load_if_enabled("se-hypercooler",                                        se_loc.."se-hypercooler")
  loader.load_if_enabled("se-thermodyn-radiation-laser-plasma-electromag-labs",   se_loc.."se-thermodyn-radiation-laser-plasma-electromag-labs")
  loader.load_if_enabled("se-partice-acc-col-fab",                                se_loc.."se-partice-acc-col-fab")
  loader.load_if_enabled("se-decontamination-lifesupport-facility",               se_loc.."se-decontamination-lifesupport-facility")
  loader.load_if_enabled("se-space-manufactory",                                  se_loc.."se-space-manufactory")
  loader.load_if_enabled("se-genetics-laboratory",                                se_loc.."se-genetics-laboratory")
  loader.load_if_enabled("se-recycler-pulveriser-mechanical",                     se_loc.."se-recycler-pulveriser-mechanical")
end
