local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local pipe_pictures = require("__Krastorio2__.prototypes.buildings.pipe-picture")
local replace = replace_func.replace_fluid_boxes

local machine_name = "cryogenic-plant"
local machine_type = "assembling-machine"

local new_fluid_boxes =
{
    {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 2000,
        pipe_connections = {
            { flow_direction = "input-output", direction = defines.direction.south, position = { -2,  2 } },
            { flow_direction = "input-output", direction = defines.direction.north, position = { -2, -2 } },
        }
    },
    {
        production_type = "input",
        pipe_picture =
            require("__sei-cryogenic-plant__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
        pipe_picture_frozen =
            require("__sei-cryogenic-plant__.prototypes.entity.cryogenic-plant-pictures").pipe_picture_frozen,
        always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
        pipe_covers = pipecoverspictures(),
        volume = 2000,
        pipe_connections = {
            { flow_direction = "input-output", direction = defines.direction.south, position = {  0,  2 } },
            { flow_direction = "input-output", direction = defines.direction.north, position = {  0, -2 } },
        }
    },
    {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections = {
            { flow_direction = "input-output", direction = defines.direction.north, position = {  2, -2 } },
            { flow_direction = "input-output", direction = defines.direction.south, position = {  2,  2 } },
        }
    },
    {
        production_type = "output",
        volume = 200,
        pipe_covers = pipecoverspictures(),
        pipe_connections = {
            { flow_direction = "input-output", direction = defines.direction.west, position = {  -2, 0 } },
            { flow_direction = "input-output", direction = defines.direction.east, position = {  2,  0 } },
        }
    },
}


replace(machine_name, machine_type, new_fluid_boxes)