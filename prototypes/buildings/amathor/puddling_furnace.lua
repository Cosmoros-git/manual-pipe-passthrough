-- Helper functions
local dh = require("lib.data-helper")
local fbh = require("lib.fluid-box-helper")
require("__apm_lib_ldinc__.lib.utils")
local pipe_pictures = apm.lib.utils.pipecovers.assembler3pipepictures()

-- Machine type and name. Can have many names.
local machine_name = "apm_puddling_furnace_0"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 200
local pipe_output_multiplier = 1/5


local pipe_positions_energy = {
    { 1, 0 },  --  middle-right
    { -1,  0 }   --  middle-left
}

local pipe_positions_input = {
    { -1, -1 }, -- top-left
    {  1, -1 }, -- top-right
}

local pipe_positions_output = {
    {  0, -1 }, -- top-center
    { -1,  1 }, -- bottom-left
    {  0,  1 }, -- bottom-center
    {  1,  1 }, -- bottom-right
}
local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_picture = pipe_pictures,
    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

if mods["space-age"] then
    pipe_args.pipe_picture_frozen = apm.lib.utils.assembler.pipe_picture_frozen()
    pipe_args.pipe_covers_frozen = apm.lib.utils.pipecovers.frozen_pipe_cover_pictures()
end

dh.replace_fluidboxes_and_power_source(machine_name, machine_type, pipe_args,pipe_positions_energy)

