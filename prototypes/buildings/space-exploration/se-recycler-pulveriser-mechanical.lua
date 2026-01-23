-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

-- Machine type and name. Can have many names.
local mechanical ="se-space-mechanical-laboratory"
local macerator ="se-pulveriser"
local recycler = "se-recycling-facility"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5

local recycler_pipe_positions_input = {
    -- Input box: north at (0, -3) and south at (0, 3)
    {
        { 0, -3 },  -- Top connection (north-facing)
        { 0,  3 }   -- Bottom connection (south-facing)
    }
}
local recycler_pipe_positions_output = {
    -- Output box: east at (3, 0) and west at (-3, 0) - reduced volume
    {
        {  3, 0 },  -- Right connection (east-facing)
        { -3, 0 }   -- Left connection (west-facing)
    }
}
local recycler_pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = recycler_pipe_positions_input,
    pipe_positions_output = recycler_pipe_positions_output,
    
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

local macerator_pipe_positions_input = {
    -- Input 1: north at (1, -3)
    { 1, -3 },  -- Top-right input (north-facing)
    -- Input 2: south at (1, 3)
    { 1,  3 }   -- Bottom-right input (south-facing)
}
local macerator_pipe_positions_output = {
    -- Output 1: south at (-1, 3) - reduced volume
    { -1,  3 },  -- Bottom-left output (south-facing)
    -- Output 2: north at (-1, -3) - reduced volume
    { -1, -3 },  -- Top-left output (north-facing)
    -- Output 3: west at (-3, -1) - reduced volume
    { -3, -1 },  -- Left-top output (west-facing)
    -- Output 4: east at (3, -1) - reduced volume
    {  3, -1 },  -- Right-top output (east-facing)
    -- Output 5: west at (-3, 1) - reduced volume
    { -3,  1 },  -- Left-bottom output (west-facing)
    -- Output 6: east at (3, 1) - reduced volume
    {  3,  1 }   -- Right-bottom output (east-facing)
}
local macerator_pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = macerator_pipe_positions_input,
    pipe_positions_output = macerator_pipe_positions_output,
    
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

local mechanical_facility_pipe_positions_input = {
    -- Input box: north at (1, -3) and south at (1, 3)
    {
        {  1, -3 },  -- Top-right connection (north-facing)
        {  1,  3 }   -- Bottom-right connection (south-facing)
    }
}
local mechanical_facility_pipe_positions_output = {
    -- Output box 1: south at (-1, 3) and north at (-1, -3)
    {
        { -1,  3 },  -- Bottom-left connection (south-facing)
        { -1, -3 }   -- Top-left connection (north-facing)
    },
    -- Output box 2: west at (-3, -1) and east at (3, -1)
    {
        { -3, -1 },  -- Left-top connection (west-facing)
        {  3, -1 }   -- Right-top connection (east-facing)
    },
    -- Output box 3: west at (-3, 1) and east at (3, 1)
    {
        { -3,  1 },  -- Left-bottom connection (west-facing)
        {  3,  1 }   -- Right-bottom connection (east-facing)
    }
}
local mechanical_facility_pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = mechanical_facility_pipe_positions_input,
    pipe_positions_output = mechanical_facility_pipe_positions_output,
    
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}


local mechanical_facility_fluid_boxes = fbh.make_pipes(mechanical_facility_pipe_args)
local macerator_fluid_boxes = fbh.make_pipes(macerator_pipe_args)
local recycler_fluid_boxes = fbh.make_pipes(recycler_pipe_args)

replace(mechanical,machine_type,mechanical_facility_fluid_boxes)
replace(macerator,machine_type,macerator_fluid_boxes)
replace(recycler,machine_type,recycler_fluid_boxes)