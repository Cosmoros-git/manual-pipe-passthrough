-- Helper functions
local dh = require("lib.data-helper")
local fbh = require("lib.fluid-box-helper")
require("__apm_lib_ldinc__.lib.utils")
local pipe_pictures = apm.lib.utils.pipecovers.assembler2pipepictures()

-- Machine type and name. Can have many names.
local machine_names = {
  "apm_greenhouse_0","apm_greenhouse_1","apm_greenhouse_2",
}

local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 200
local pipe_output_multiplier = 1/5

local pipe_positions_energy = {
    { 1, 0 },  --  middle-right
    { -1,  0 }   --  middle-left
}
local pipe_positions_input = {
    { 0, -1 },  -- Top input (north-facing)
    { 0,  1 }   -- Bottom input (south-facing)
}
local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,

    pipe_picture = pipe_pictures,
    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

if mods["space-age"] then
    pipe_args.pipe_picture_frozen = apm.lib.utils.assembler.pipe_picture_frozen()
    pipe_args.pipe_covers_frozen = apm.lib.utils.pipecovers.frozen_pipe_cover_pictures()
end

for _, name in ipairs(machine_names) do
  dh.replace_fluidboxes_and_power_source(name, machine_type, pipe_args,pipe_positions_energy)
end
