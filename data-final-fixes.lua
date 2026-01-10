
require("prototypes.buildings.vanilla.oil-refinery")
require("prototypes.buildings.vanilla.chem-plant")

if mods["Krastorio2Assets"] then
  require("prototypes.buildings.k2.kr-advanced-furnace")
  require("prototypes.buildings.k2.kr-advanced-chemical-plant")
  require("prototypes.buildings.k2.kr-matter-associator")
  require("prototypes.buildings.k2.kr-fuel-refinery")
  require("prototypes.buildings.k2.kr-atmospheric-condenser")
  require("prototypes.buildings.k2.kr-quantum-computer")
  require("prototypes.buildings.k2.kr-matter-plant")
end

if mods["space-exploration"] then
  require("prototypes.buildings.space-exploration.se-fuel-refinery")
  require("prototypes.buildings.space-exploration.se-growth-facility")
  require("prototypes.buildings.space-exploration.se-hypercooler")
  require("prototypes.buildings.space-exploration.se-thermodyn-radiation-laser-plasma-electromag-labs")
  require("prototypes.buildings.space-exploration.se-partice-acc-col-fab")
  require("prototypes.buildings.space-exploration.se-decontamination-lifesupport-facility")
  require("prototypes.buildings.space-exploration.se-space-manufactory")
  require("prototypes.buildings.space-exploration.se-genetics-laboratory")
  require("prototypes.buildings.space-exploration.se-recycler-pulveriser-mechanical")
end

if mods["sei-cryogenic-plant"] then
  require("prototypes.buildings.space-exploration.sei-cryogenic-plant")
end