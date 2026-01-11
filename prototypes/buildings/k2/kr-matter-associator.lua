local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

local machine_name = "kr-matter-associator"
local machine_type = "assembling-machine"
local pipe_volume = 500
local pipe_output_multipler = 1/5

local new_fluid_boxes =
{
       {
        production_type = "input",
        pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = { 
          { flow_direction = "input-output", direction = defines.direction.north, position = { 0, -3 } }},
      },
      {
        production_type = "input",
        pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = { 
          { flow_direction = "input-output", direction = defines.direction.south, position = { 0, 3 } } },
      },
      {
        production_type = "output",
        pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = { 
          { flow_direction = "input-output", direction = defines.direction.west, position = { -3, 0 } }},
      },
       {
        production_type = "output",
        pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = { 
         { flow_direction = "input-output", direction = defines.direction.east, position = { 3, 0 } } },
      },
}

replace(machine_name, machine_type, new_fluid_boxes)
