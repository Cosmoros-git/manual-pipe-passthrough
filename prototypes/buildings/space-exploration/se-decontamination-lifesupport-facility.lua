
-- Helper functions
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_name = "se-lifesupport-facility"
local machine_name_2 = "se-space-decontamination-facility"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    -- First input box: north at (-1.5, -2.5) and south at (-1.5, 2.5)
    {
        { -1.5, -2.5 },  -- Top connection (north-facing)
        { -1.5,  2.5 }   -- Bottom connection (south-facing)
    },
    -- Second input box: north at (1.5, -2.5) and south at (1.5, 2.5)
    {
        {  1.5, -2.5 },  -- Top connection (north-facing)
        {  1.5,  2.5 }   -- Bottom connection (south-facing)
    }
}

local pipe_positions_output = {
    -- First output box: west at (-2.5, 1.5) and east at (2.5, 1.5)
    {
        { -2.5,  1.5 },  -- Left connection (west-facing)
        {  2.5,  1.5 }   -- Right connection (east-facing)
    },
    -- Second output box: west at (-2.5, -1.5) and east at (2.5, -1.5)
    {
        { -2.5, -1.5 },  -- Left connection (west-facing)
        {  2.5, -1.5 }   -- Right connection (east-facing)
    }
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
dh.replace_fluidboxes(machine_name_2, machine_type, pipe_args)
