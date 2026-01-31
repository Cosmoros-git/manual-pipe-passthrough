-- Helper functions
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_name = "se-space-assembling-machine"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 200
local pipe_output_multiplier = 1/5

-- SE unused pipe pictures for some reason?
local loc = "__space-exploration-graphics__/graphics/entity/assembling-machine/"
local pipe_pictures = {
  north = {
    filename = loc.."assembling-machine-pipe-N.png",
    priority = "extra-high",
    width = 71,
    height = 38,
    shift = util.by_pixel(2.25, 13.5),
    scale = 0.5,
  },
  east = {
    filename = loc.."assembling-machine-pipe-E.png",
    priority = "extra-high",
    width = 42,
    height = 76,
    shift = util.by_pixel(-24.5, 1),
    scale = 0.5,
  },
  south = {
    filename = loc.."assembling-machine-pipe-S.png",
    priority = "extra-high",
    width = 88,
    height = 61,
    shift = util.by_pixel(0, -31.25),
    scale = 0.5,
  },
  west = {
    filename = loc.."assembling-machine-pipe-W.png",
    priority = "extra-high",
    width = 39,
    height = 73,
    shift = util.by_pixel(25.75, 1.25),
    scale = 0.5,
  },
}

local pipe_positions_input = {
    { 0, -1 },  -- Top input (north-facing)
    { 0,  1 }   -- Bottom input (south-facing)
}

local pipe_positions_output = {
    { -1, 0 },  -- Left output (west-facing) 
    {  1, 0 }   -- Right output (east-facing) 
}
local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_picture = pipe_pictures,
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

dh.replace_fluidboxes(machine_name, machine_type, pipe_args)
