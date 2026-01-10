local replace_func = require("lib.replace-fluidbox")
local pipe_pictures = require("__Krastorio2__.prototypes.buildings.advanced-furnace-pipe-pictures")
local replace = replace_func.replace_fluid_boxes

local machine_name = "kr-advanced-furnace"
local machine_type = "assembling-machine"
local pipe_volume = 3000

local new_fluid_boxes =
{
      {
        production_type = "input",
        pipe_picture = pipe_pictures.a,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = { 
        { flow_direction = "input-output", direction = defines.direction.north, position = { -1, -3 } },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 3, -1 } }  },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "input",
        pipe_picture = pipe_pictures.b,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = { 
        { flow_direction = "input-output", direction = defines.direction.north, position = { 1, -3 } },
        { flow_direction = "input-output", direction = defines.direction.west, position = { -3, -1 } }},
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures.b,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = { 
        { flow_direction = "input-output", direction = defines.direction.south, position = { -1, 3 } },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 3, 1 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures.a,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = { 
        { flow_direction = "input-output", direction = defines.direction.south, position = { 1, 3 } },
        { flow_direction = "input-output", direction = defines.direction.west, position = { -3, 1 } } },
        secondary_draw_orders = { north = -1 },
      },
}

replace(machine_name, machine_type, new_fluid_boxes)
