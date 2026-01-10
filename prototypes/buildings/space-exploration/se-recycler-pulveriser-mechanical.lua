local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

local machine_names = {"se-pulveriser","se-space-mechanical-laboratory"}
local recycler = "se-recycling-facility"
local machine_type = "assembling-machine"
local pipe_volume = 8000


local fluid_boxes_4 =
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
    volume = pipe_volume,
    pipe_connections = {
    { flow_direction="input-output", position = {3, 0}, direction = defines.direction.east },
    { flow_direction="input-output", position = {-3, 0}, direction = defines.direction.west }
  },
    secondary_draw_orders = { north = -1 }
  },
}

local fluid_boxes_8 =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = {  1, -3 }, direction = defines.direction.north },
      { flow_direction = "input-output", position = {  1,  3 }, direction = defines.direction.south },
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = { -1,  3 }, direction = defines.direction.south },
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = { -1, -3 }, direction = defines.direction.north },
    },
    secondary_draw_orders = { north = -1 }
  },

  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = { -3, -1 }, direction = defines.direction.west },
      { flow_direction = "input-output", position = {  3, -1 }, direction = defines.direction.east },
    },
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction = "input-output", position = { -3,  1 }, direction = defines.direction.west },
      { flow_direction = "input-output", position = {  3,  1 }, direction = defines.direction.east },
    },
    secondary_draw_orders = { north = -1 }
  },
}



for _, name in ipairs(machine_names) do
  replace(name, machine_type, fluid_boxes_8)
end
replace(recycler,machine_type,fluid_boxes_4)