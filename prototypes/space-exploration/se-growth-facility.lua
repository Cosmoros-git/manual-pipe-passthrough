local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local pipe_pictures = require("__Krastorio2__.prototypes.buildings.pipe-picture")
local replace = replace_func.replace_fluid_boxes

local machine_name = "se-space-growth-facility"
local machine_type = "assembling-machine"

local new_fluid_boxes = {
      {
          production_type = "input",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {-4, 2}, direction = defines.direction.west }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "input",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {-2, -4}, direction = defines.direction.north }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "input",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {-4, 0}, direction = defines.direction.west }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "input",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {0, -4}, direction = defines.direction.north }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "input",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {-4, -2}, direction = defines.direction.west }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "input",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {2, -4}, direction = defines.direction.north }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {-2, 4}, direction = defines.direction.south }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {4, 2}, direction = defines.direction.east }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {0, 4}, direction = defines.direction.south }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {4, 0}, direction = defines.direction.east }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {2, 4}, direction = defines.direction.south }},
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_picture = pipe_pics,
          volume = 1000,
          pipe_connections = {{ flow_direction="input-output", position = {4, -2}, direction = defines.direction.east }},
          secondary_draw_orders = { north = -1 }
      },
    }

replace(machine_name, machine_type, new_fluid_boxes)