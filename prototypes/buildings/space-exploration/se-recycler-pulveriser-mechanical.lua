local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

local mechanical ="se-space-mechanical-laboratory"
local macerator ="se-pulveriser"
local recycler = "se-recycling-facility"
local machine_type = "assembling-machine"
local pipe_volume = 1000
local pipe_output_multipler = 1/5

local recycler_fluid_boxes =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
    { flow_direction="input-output", position = {0, -3}, direction = defines.direction.north },
    { flow_direction="input-output", position = {0, 3}, direction = defines.direction.south }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
    { flow_direction="input-output", position = {3, 0}, direction = defines.direction.east },
    { flow_direction="input-output", position = {-3, 0}, direction = defines.direction.west }
  },
    secondary_draw_orders = { north = -1 }
  },
}

local macerator_fluid_boxes =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = {  1, -3 }, direction = defines.direction.north }
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = {  1,  3 }, direction = defines.direction.south }
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = { -1,  3 }, direction = defines.direction.south },
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = { -1, -3 }, direction = defines.direction.north },
    },
    secondary_draw_orders = { north = -1 }
  },

  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = { -3, -1 }, direction = defines.direction.west }
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = {  3, -1 }, direction = defines.direction.east }
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = { -3,  1 }, direction = defines.direction.west }
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = {  3,  1 }, direction = defines.direction.east },
    },
    secondary_draw_orders = { north = -1 }
  },
}

local mechanical_facility_fluid_boxes =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = {  1, -3 }, direction = defines.direction.north },
      { flow_direction = "input-output", position = {  1,  3 }, direction = defines.direction.south }
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = { -1,  3 }, direction = defines.direction.south },
      { flow_direction = "input-output", position = { -1, -3 }, direction = defines.direction.north },
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = { -3, -1 }, direction = defines.direction.west },
      { flow_direction = "input-output", position = {  3, -1 }, direction = defines.direction.east }
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction = "input-output", position = { -3,  1 }, direction = defines.direction.west },
      { flow_direction = "input-output", position = {  3,  1 }, direction = defines.direction.east },
    },
    secondary_draw_orders = { north = -1 }
  },
}

replace(mechanical,machine_type,mechanical_facility_fluid_boxes)
replace(macerator,machine_type,macerator_fluid_boxes)
replace(recycler,machine_type,recycler_fluid_boxes)