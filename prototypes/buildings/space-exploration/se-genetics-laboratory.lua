-- Helper functions
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_name = "se-space-genetics-laboratory"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 2000
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    { 0, -3 },  -- Top center input connection (north-facing)
    { 0,  3 },  -- Bottom center input connection (south-facing)
}

local pipe_positions_output = {
    { -3, 0 },  -- Left center output connection (west-facing)
    {  3, 0 },  -- Right center output connection (east-facing)
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

dh.replace_fluidboxes(machine_name, machine_type, pipe_args)