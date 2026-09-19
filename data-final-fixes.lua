local loader = require("lib.settings-helper") -- Helps making this less of a mess.

--- Pipe pictures for mods
-- KRASTORIO 2
K2_PIPE_PICTURES_MOD =
    mods["Krastorio2-spaced-out"] and "__Krastorio2-spaced-out__"
    or mods["Krastorio2"] and "__Krastorio2__"
    or nil

-- Deals with quality assurance mod. 
if mods["QualityAssurance"] then
  QAM_ENABLED = true
  QAM_PREFIX = "qa_"
  QAM_SUFFIX = "-ams"
else
  QAM_ENABLED = false
  QAM_PREFIX = ""
  QAM_SUFFIX = ""
end

-- VANILLA
local vanilla_loc = "prototypes.buildings.vanilla."
-- loader.load_if_enabled("v_oil-refinery",    vanilla_loc.."oil-refinery") Disabled until sprite update
loader.load_if_enabled("v_chem-plant",      vanilla_loc.."chem-plant")
loader.load_if_enabled("v_assemblers",      vanilla_loc.."assemblers")

-- SPACE AGE
local spacedOut_loc ="prototypes.buildings.space-age."
if mods["sei-library-2"] or mods["space-age"] then
  loader.load_if_enabled("sei_cryogenic-plant",    spacedOut_loc.."cryogenic-plant")
  loader.load_if_enabled("sei_foundry",            spacedOut_loc.."foundry")
  loader.load_if_enabled("sei_biochamber",         spacedOut_loc.."biochamber")
end





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
  loader.load_if_enabled("kr-advanced-assembler",      k2_loc.."kr-advanced-assembler")
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
  loader.load_if_enabled("se-space-assembler",                                    se_loc.."se-space-assembler")
  loader.load_if_enabled("se-genetics-laboratory",                                se_loc.."se-genetics-laboratory")
  loader.load_if_enabled("se-recycler-pulveriser-mechanical",                     se_loc.."se-recycler-pulveriser-mechanical")
end


-- APM enabled
local apm_loc = "prototypes.buildings.amathor."
if mods["apm_power_ldinc"] then
  loader.load_if_enabled("apm-air-cleaning-machine", apm_loc .. "air_cleaning_machine")
  loader.load_if_enabled("apm-assembler",            apm_loc .. "assembler")
  loader.load_if_enabled("apm-centrifuge",           apm_loc .. "centrifuge")
  loader.load_if_enabled("apm-coking-plant",         apm_loc .. "coking_plant")
  loader.load_if_enabled("apm-crushers",             apm_loc .. "crushers")
  loader.load_if_enabled("apm-greenhouse",           apm_loc .. "greenhouse")
  loader.load_if_enabled("apm-press-machine",        apm_loc .. "press_machine")
  loader.load_if_enabled("apm-puddling-furnace",     apm_loc .. "puddling_furnace")
  loader.load_if_enabled("apm-sieve",                apm_loc .. "sieve")
  loader.load_if_enabled("apm-steelworks",           apm_loc .. "steelworks")
end