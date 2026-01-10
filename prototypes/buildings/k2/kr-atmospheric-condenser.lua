local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

local machine_name = "kr-atmospheric-condenser"
local machine_name_2 = "se-space-biochemical-laboratory"

local machine_type = "assembling-machine"
local pipe_volume = 10000


local new_fluid_boxes = {
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2, -1 } },
        { flow_direction = "input-output", direction = defines.direction.east, position = { 2, 1 } },
        { flow_direction = "input-output", direction = defines.direction.west, position = { -2, -1 } },
        { flow_direction = "input-output", direction = defines.direction.west, position = { -2, 1 } },
        { flow_direction = "input-output", direction = defines.direction.north, position = { 1, -2 } },
        { flow_direction = "input-output", direction = defines.direction.north, position = { -1, -2 } },
        { flow_direction = "input-output", direction = defines.direction.south, position = { 1, 2 } },
        { flow_direction = "input-output", direction = defines.direction.south, position = { -1, 2 } },
    },
    secondary_draw_orders = { north = -1 },
  },
}


replace(machine_name_2, machine_type, new_fluid_boxes)
replace(machine_name, machine_type, new_fluid_boxes)