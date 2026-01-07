
require("prototypes.vanilla.oil-refinery")

if mods["Krastorio2Assets"] then
  require("prototypes.k2.advanced-furnace")
  require("prototypes.k2.advanced-chem-plant")
  require("prototypes.k2.matter-assoc")
  require("prototypes.k2.fuel-refinery")
end

if mods["space-exploration"] then
  require("prototypes.space-exploration.se-fuel-refinery")
  require("prototypes.space-exploration.se-growth-facility")
  require("prototypes.space-exploration.se-hypercooler")
  require("prototypes.space-exploration.se-thermo-laser-rad-labs")
end

if mods["sei-cryogenic-plant"] then
  require("prototypes.space-exploration.sei-cryogenic-plant")
end