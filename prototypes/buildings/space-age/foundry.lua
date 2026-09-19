        -- Helper functions
local pipes_lib = require("lib.add-pipes-simple")
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_name = "foundry"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5

local frames = 128
local foundry_animation_speed = 0.16

local west = {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-age/foundry/foundry-pipe-connections-west.png",
    width = 44,
    height = 190,
    shift = util.by_pixel( -69.5, 1.5),
    line_length = 32,
    animation_speed = foundry_animation_speed,
    frame_count = frames,
    scale = 0.5
}


local east = {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-age/foundry/foundry-pipe-connections-east.png",
    width = 18,
    height = 190,
    shift = util.by_pixel( 76.0, 1.5),
    line_length = 1,
    repeat_count = frames,
    scale = 0.5
}

local north = {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-age/foundry/foundry-pipe-connections-north.png",
    width = 176,
    height = 50,
    shift = util.by_pixel( 1.0, -77.5),
    line_length = 1,
    repeat_count = frames,
    scale = 0.5
    
}

local south = {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-age/foundry/foundry-pipe-connections-south.png",
    width = 188,
    height = 68,
    shift = util.by_pixel( 0.5, 74.5),
    line_length = 1,
    repeat_count = frames,
    scale = 0.5
}

local pipes_above = {
    layers = {
            west,
            east,
            north,
            south,
    }
}

local pipe_positions_input = {
    { -2,  -1 },  -- Left input (west-facing)
    {  2,  -1 },  -- Right input (east-facing)
    { -2,  1 },  -- Left input (west-facing)
    {  2,  1 }   -- Right input (east-facing)
}

local pipe_positions_output = {
    {  -1, -2 },  -- Top output (north-facing)
    {  -1,  2 },  -- Bottom output (south-facing)
    {  1, -2 },  -- Top output (north-facing)
    {  1,  2 }   -- Bottom output (south-facing)
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
pipes_lib.add_pipes_simple_to_animation(machine_name, machine_type, nil, pipes_above)

