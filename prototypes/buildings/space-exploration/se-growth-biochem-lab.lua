-- Helper functions
local fbh = require("lib.fluid-box-helper")




local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

-- Machine type and name. Can have many names.
local growth_facility = "se-space-growth-facility"
local biochemical_lab = "se-space-biochemical-laboratory"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 2000
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    -- Input box 1: north at (-2, -4) and south at (-2, 4)
    {
        { -2, -4 },  -- Top connection (north-facing)
        { -2,  4 }   -- Bottom connection (south-facing)
    },
    -- Input box 2: north at (0, -4) and south at (0, 4)
    {
        {  0, -4 },  -- Top connection (north-facing)
        {  0,  4 }   -- Bottom connection (south-facing)
    },
    -- input box 3: north at (2, -4) and south at (2, 4)
    {
        {  2, -4 },  -- Top connection (north-facing)
        {  2,  4 }   -- Bottom connection (south-facing)
    }
}

local pipe_positions_output = {
    -- Output box 1: west at (-4, -2)
    {
        { -4, -2 }   -- Left connection (west-facing) 
    },
    -- Output box 2: east at (4, -2)
    {
        {  4, -2 }   -- Right connection (east-facing) 
    },
    -- Output box 3: west at (-4, 0) 
    {
        { -4, 0 }    -- Left connection (west-facing) 
    },
    -- Output box 4: east at (4, 0) 
    {
        {  4, 0 }    -- Right connection (east-facing) 
    },
    -- Output box 5: west at (-4, 2) 
    {
        { -4, 2 }    -- Left connection (west-facing) 
    },
    -- Output box 6: east at (4, 2) 
    {
        {  4, 2 }    -- Right connection (east-facing) 
    }
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
replace(biochemical_lab, machine_type, new_fluid_boxes)
replace(growth_facility, machine_type, new_fluid_boxes)