local replace_func = require("lib.replace-fluidbox")
local pipes_lib = require("lib.add-pipes-simple")
local replace = replace_func.replace_fluid_boxes

local machines_add_pipes = {
  "se-space-thermodynamics-laboratory",
  "se-space-radiation-laboratory",
  "se-space-laser-laboratory",
}
local plasma_gen = "se-space-plasma-generator"
local electro_lab = "se-space-electromagnetics-laboratory"

local machine_type = "assembling-machine"
local pipe_volume = 500
local pipe_output_multipler = 1/5

local pipes_below = {
 filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/laser-rad-thermal/pipes-below.png",
      width = 448,
      height = 480,
      frame_count = 1,
      repeat_count = 64,
      shift = util.by_pixel(0, -24),
      scale = 0.5,
      draw_as_underlay = true,
}
local pipes_above = {
   filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/laser-rad-thermal/pipes-above.png",
      width = 448,
      height = 480,
      frame_count = 1,
      repeat_count = 64,
      shift = util.by_pixel(0, -24),
      scale = 0.5,
}

local electro_fluid_boxes= {
   {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", position = {0, -3}, direction = defines.direction.north }
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", position = {0,  3}, direction = defines.direction.south },
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = {-3, 0}, direction = defines.direction.west }
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = { 3, 0}, direction = defines.direction.east },
    },
    secondary_draw_orders = { north = -1 },
  },
}

local new_fluid_boxes = {
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", position = {0, -3}, direction = defines.direction.north },
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", position = {0,  3}, direction = defines.direction.south },
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = {-3, 0}, direction = defines.direction.west },
    },
    secondary_draw_orders = { north = -1 },
  },
    {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = { 3, 0}, direction = defines.direction.east },
    },
    secondary_draw_orders = { north = -1 },
  },
}


for _, name in ipairs(machines_add_pipes) do
  replace(name, machine_type, new_fluid_boxes)
  pipes_lib.add_pipes_simple(name, machine_type, pipes_below, pipes_above)
end

replace(plasma_gen, machine_type, new_fluid_boxes)
replace(electro_lab, machine_type, electro_fluid_boxes)

-- Electromagneitc and Plasma gen dont need new pipes. However electro_lab needs at least 2 outputs.