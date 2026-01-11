local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

local machine_name = "se-space-genetics-laboratory"
local machine_type = "assembling-machine"
local pipe_volume = 2000 
local pipe_output_multipler = 1/5

local new_fluid_boxes =
{

      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = {
        { flow_direction="input-output", position = {0, -3}, direction = defines.direction.north }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = {
        { flow_direction="input-output", position = {0, 3}, direction = defines.direction.south }
      },
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
        { flow_direction="input-output", position = {-3, 0}, direction = defines.direction.west }},
        secondary_draw_orders = { north = -1 }
      },
      
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
        { flow_direction="input-output", position = {3, 0}, direction = defines.direction.east }
      },
        secondary_draw_orders = { north = -1 }
      },
}

replace(machine_name, machine_type, new_fluid_boxes)