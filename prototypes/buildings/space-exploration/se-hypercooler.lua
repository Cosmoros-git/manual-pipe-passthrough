-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes


-- Machine type and name. Can have many names.
local machine_name = "se-space-hypercooler"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 500
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    { 0, -2 },  -- Top input (north-facing)
    { 0,  2 }   -- Bottom input (south-facing)
}

local pipe_positions_output = {
    { -2, 0 },  -- Left output (west-facing) 
    {  2, 0 }   -- Right output (east-facing) 
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

local new_fluid_boxes = fbh.make_pipes(pipe_args)
replace(machine_name, machine_type, new_fluid_boxes)