# manual-pipe-passthrough
Collection of visual and code fixes.

Guide on how to patch your own machine:

Create a separate .lua file in a similar format prototype/building/mod_name/mod_name-machine_name.lua
 For easier work you can copy any other similar file.

Then, take the fluidboxes code from the machine you are trying to patch. The positions on the machine will help with manual work. As example have this:
I suggest copying all of this and just modifying how you need it.

-- Helper functions
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local fbh = require("lib.fluid-box-helper")

-- Machine type and name. Can have many names.
local machine_name = "machine-name"
local machine_type = "machine-type", commonly assembler.

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    { 0, -3 },  -- Top center input (north-facing)
    { 0,  3 },  -- Bottom center input (south-facing)
}

local pipe_positions_output = {
    { -3, 0 },  -- Left center output (west-facing)
    {  3, 0 },  -- Right center output (east-facing)
}

-- IF you want "connected" fluid boxes just write them like this
-- Example taken from oil-refinery
local pipe_positions_input = {
    -- Input Box A: south at (-1, 2) and north at (-2, -2)
    {
        { -1,  2 },  -- Bottom connection (south-facing)
        { -2, -2 }   -- Top connection (north-facing)
    },
    -- Input Box B: south at (1, 2), north at (0, -2), and north at (2, -2)
    {
        {  1,  2 },  -- Bottom connection (south-facing)
        {  0, -2 },  -- Top-left connection (north-facing)
        {  2, -2 }   -- Top-right connection (north-facing)
    }
}

local pipe_args = {
    volume = pipe_volume,  -- Obligatory
    output_multiplier = pipe_output_multiplier, --Not obligatory

    pipe_positions_input = pipe_positions_input, --One of 2 is obligatory
    pipe_positions_output = pipe_positions_output, --One of 2 is obligatory

    pipe_picture = pipe_pictures, -- Not obligatory
    pipecoverspictures = pipecoverspictures(), -- Not obligatory
    --other possible inputs acceptable here are
    --always_draw_covers
    --pipe.secondary_draw_orders
}
local new_fluid_boxes = fbh.make_pipes(pipe_args)
replace(machine_name, machine_type, new_fluid_boxes)

Fastest solution is just asking chatbot giving it old inputs and asking it to modify it to this pattern.