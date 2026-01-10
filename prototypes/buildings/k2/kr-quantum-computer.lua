local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local pipes_lib = require("lib.add-pipes-simple")

local machine_name = "kr-quantum-computer"
local machine_type = "assembling-machine"
local pipe_volume = 500

local pipes_above = {
    filename = "__manual-pipe-passthrough__/graphics/buildings/kr/kr-quantum-computer/pipes-above.png",
    priority = "high",
    width = 400,
    height = 420,
    shift = { 0, -0.2 },
    frame_count = 1,
    repeat_count = 48,
    scale = 0.5,
} -- Ended unused

local pipes_below = {
    filename = "__manual-pipe-passthrough__/graphics/buildings/kr/kr-quantum-computer/pipes-below.png",
    priority = "high",
    width = 400,
    height = 420,
    shift = { 0, -0.2 },
    frame_count = 1,
    repeat_count = 48,
    scale = 0.5,
}

-- In SE it hiding its fluid boxes kinda makes no sense. And I dont want to deal with drawing custom pipe covers...
local entity = data.raw[machine_type] and data.raw[machine_type][machine_name]
  if entity then
        entity.fluid_boxes_off_when_no_fluid_recipe = false
  else
end

local new_fluid_boxes =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", direction = defines.direction.west, position = { -2.5,  0.5 } },
      { flow_direction = "input-output", direction = defines.direction.east, position = {  2.5, -0.5 } },
    },
    secondary_draw_orders = { north = -1 },
    always_draw_covers = true;
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", direction = defines.direction.west, position = { -2.5, -0.5 } },
      { flow_direction = "input-output", direction = defines.direction.east, position = {  2.5, 0.5 } },
    },
    secondary_draw_orders = { north = -1 },
    always_draw_covers = true;
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", direction = defines.direction.south, position = {  0.5,  2.5 } },
      { flow_direction = "input-output", direction = defines.direction.north, position = { -0.5, -2.5 } },
    },
    secondary_draw_orders = { north = -1 },
    always_draw_covers = true;
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", direction = defines.direction.south, position = {  -0.5,  2.5 } },
      { flow_direction = "input-output", direction = defines.direction.north, position = { 0.5, -2.5 } },
    },
    secondary_draw_orders = { north = -1 },
    always_draw_covers = true;
  },
}
pipes_lib.add_pipes_simple(machine_name, machine_type, pipes_below, nill)
replace(machine_name, machine_type, new_fluid_boxes)