local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

local machine_name = "se-space-thermodynamics-laboratory"
local machine_name_2 = "se-space-radiation-laboratory"
local machine_name_3 = "se-space-laser-laboratory"
local machine_type = "assembling-machine"

local new_fluid_boxes = {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {
            { flow_direction="input-output", position = {0, -3}, direction = defines.direction.north },
            { flow_direction="input-output", position = {0, 3}, direction = defines.direction.south }},
            secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {
            { flow_direction="input-output", position = {-3, 0}, direction = defines.direction.west },
            { flow_direction="input-output", position = {3, 0}, direction = defines.direction.east }},
        secondary_draw_orders = { north = -1 }
      },
    }

replace(machine_name, machine_type, new_fluid_boxes)
replace(machine_name_2, machine_type, new_fluid_boxes)
replace(machine_name_3, machine_type, new_fluid_boxes)