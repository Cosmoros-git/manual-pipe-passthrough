local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

local machine_name = "se-space-growth-facility"
local machine_name_2 = "se-space-biochemical-laboratory"

local machine_type = "assembling-machine"
local pipe_volume = 2000
local pipe_output_multipler = 1/5

local new_fluid_boxes = {
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = { -2, -4 }, direction = defines.direction.north },
      { flow_direction = "input-output", position = { -2,  4 }, direction = defines.direction.south },
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = { 0, -4 }, direction = defines.direction.north },
      { flow_direction = "input-output", position = { 0,  4 }, direction = defines.direction.south },
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = { 2, -4 }, direction = defines.direction.north },
      { flow_direction = "input-output", position = { 2,  4 }, direction = defines.direction.south }
    },
    secondary_draw_orders = { north = -1 },
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = { -4, -2 }, direction = defines.direction.west },
    }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = {  4, -2 }, direction = defines.direction.east },
    }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", position = { -4, 0 }, direction = defines.direction.west },
    }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", position = {  4, 0 }, direction = defines.direction.east },
    }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = { -4, 2 }, direction = defines.direction.west },
    }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", position = {  4, 2 }, direction = defines.direction.east },
    }
  },
}


replace(machine_name_2, machine_type, new_fluid_boxes)
replace(machine_name, machine_type, new_fluid_boxes)