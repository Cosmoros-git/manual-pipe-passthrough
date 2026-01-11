local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

local machine_name = "kr-advanced-chemical-plant"
local machine_type = "assembling-machine"
local pipe_volume = 1000
local pipe_output_multipler = 1/5
local new_fluid_boxes =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
    volume = pipe_volume,
    pipe_connections =
    {
      { direction = defines.direction.north, position = { -2, -3 } },
      { direction = defines.direction.south, position = { -2,  3 } },
    },
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
    volume = pipe_volume,
    pipe_connections =
    {
      { direction = defines.direction.north, position = {  0, -3 } },
      { direction = defines.direction.south, position = {  0,  3 } },
    },
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
    volume = pipe_volume,
    pipe_connections =
    {
      { direction = defines.direction.north, position = {  2, -3 } },
      { direction = defines.direction.south, position = {  2,  3 } },
    },
  },

  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections =
    {
      { direction = defines.direction.west, position = { -3, -2 } },
      { direction = defines.direction.east, position = {  3, -2 } },
    },
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections =
    {
      { direction = defines.direction.west, position = { -3,  0 } },
      { direction = defines.direction.east, position = {  3,  0 } },
    },
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    pipe_picture = require("__Krastorio2__.prototypes.buildings.pipe-picture"),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections =
    {
      { direction = defines.direction.west, position = { -3,  2 } },
      { direction = defines.direction.east, position = {  3,  2 } },
    },
  },
}
replace(machine_name, machine_type, new_fluid_boxes)
