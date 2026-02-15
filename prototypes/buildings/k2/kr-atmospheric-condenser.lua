-- Helper functions
local dh = require("lib.data-helper")

-- Machine type and name. Can be many names
local machine_name = "kr-atmospheric-condenser"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 200
-- Output multiplier not needed when there is no inputs.

local pipe_positions_output = {
    -- Right side connections (east-facing)
    { 2, -1 },  -- Right, top connection
    { 2, 1 },   -- Right, bottom connection

    -- Left side connections (west-facing)  
    { -2, -1 }, -- Left, top connection
    { -2, 1 },  -- Left, bottom connection

    -- Top side connections (north-facing)
    { 1, -2 },  -- Top, right connection
    { -1, -2 }, -- Top, left connection

    -- Bottom side connections (south-facing)
    { 1, 2 },   -- Bottom, right connection
    { -1, 2 },  -- Bottom, left connection
}

local pipe_args = {
    volume = pipe_volume,
    pipe_positions_output = pipe_positions_output,
    pipe_covers = pipecoverspictures(),

    secondary_draw_orders = { north = -1 },
}

dh.replace_fluidboxes(machine_name,machine_type,pipe_args)