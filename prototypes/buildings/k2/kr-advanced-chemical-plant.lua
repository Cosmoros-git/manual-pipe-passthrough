
-- Helper functions
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local fbh = require("lib.fluid-box-helper")

-- K2 Pipe pictures dependency
local pipe_pictures = ""
if K2_PIPE_PICTURES_MOD then
    pipe_pictures =
        require(K2_PIPE_PICTURES_MOD ..
            ".prototypes.buildings.pipe-picture")
end

-- Machine type and name. Can be many names
local machine_name = "kr-advanced-chemical-plant"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    -- First input box (left column)
    { -2, -3 },  -- north connection
    { -2,  3 },  -- south connection
    
    -- Second input box (middle column)  
    {  0, -3 },  -- north connection
    {  0,  3 },  -- south connection
    
    -- Third input box (right column)
    {  2, -3 },  -- north connection
    {  2,  3 },  -- south connection
}

local pipe_positions_output = {
    -- First output box (top row)
    { -3, -2 },  -- west connection
    {  3, -2 },  -- east connection
    
    -- Second output box (middle row)
    { -3,  0 },  -- west connection
    {  3,  0 },  -- east connection
    
    -- Third output box (bottom row)
    { -3,  2 },  -- west connection
    {  3,  2 },  -- east connection
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_pictures = pipe_pictures,
    pipecoverspictures = pipecoverspictures(),
}
local new_fluid_boxes = fbh.make_pipes(pipe_args)
replace(machine_name, machine_type, new_fluid_boxes)
