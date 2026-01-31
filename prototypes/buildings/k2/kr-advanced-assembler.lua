-- Helper functions
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_name = "kr-advanced-assembling-machine"
local machine_type = "assembling-machine"

--K2 Pipe pictures
local pipe_pictures = {
  north = {
    filename = "__Krastorio2Assets__/buildings/advanced-assembling-machine/advanced-assembling-machine-k-pipe-N.png",
    priority = "extra-high",
    width = 71,
    height = 38,
    shift = util.by_pixel(2.25, 13.5),
    scale = 0.5,
  },
  east = {
    filename = "__Krastorio2Assets__/buildings/advanced-assembling-machine/advanced-assembling-machine-k-pipe-E.png",
    priority = "extra-high",
    width = 42,
    height = 76,
    shift = util.by_pixel(-24.5, 1),
    scale = 0.5,
  },
  south = {
    filename = "__Krastorio2Assets__/buildings/advanced-assembling-machine/advanced-assembling-machine-k-pipe-S.png",
    priority = "extra-high",
    width = 88,
    height = 61,
    shift = util.by_pixel(0, -31.25),
    scale = 0.5,
  },
  west = {
    filename = "__Krastorio2Assets__/buildings/advanced-assembling-machine/advanced-assembling-machine-k-pipe-W.png",
    priority = "extra-high",
    width = 39,
    height = 73,
    shift = util.by_pixel(25.75, 1.25),
    scale = 0.5,
  },
}

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

    pipe_picture = pipe_pictures,
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

dh.replace_fluidboxes(machine_name, machine_type, pipe_args)
