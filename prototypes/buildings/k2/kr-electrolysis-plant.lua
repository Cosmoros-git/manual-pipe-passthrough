-- Helper functions
local dh = require("lib.data-helper")

-- K2 Pipe pictures dependency
local pipe_pictures = ""
if K2_PIPE_PICTURES_MOD then
    pipe_pictures =
        require(K2_PIPE_PICTURES_MOD ..
            ".prototypes.buildings.pipe-picture")
end
-- Machine type and name. Can be many names
local machine_name = "kr-electrolysis-plant"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 200
-- Output multiplier not needed when there is no inputs.

local pipe_positions_input = {
    {{ -2, -1 },  -- Top left input (west-facing)
    { 2, -1 }},   -- Bottom left input (east-facing)

    {{ -2,  1 },  -- Top right input (west-facing)
    { 2,  1 }},   -- Bottom right input (east-facing)
}

local pipe_positions_output = {
    {{ -1, -2 } , -- Top left output (north-facing)
    { -1,  2 }},  -- Bottom left output (south-facing)
    
    {{  1, -2 },  -- Top right output (north-facing)
    {  1,  2 }},  -- Bottom right output (south-facing)
}

local pipe_args = {
    volume = pipe_volume,
    pipe_positions_output = pipe_positions_output,
    pipe_positions_input = pipe_positions_input,
    pipe_covers = pipecoverspictures(),
    pipe_picture = pipe_pictures,

    secondary_draw_orders = { north = -1 },
}
dh.replace_fluidboxes(machine_name,machine_type,pipe_args)