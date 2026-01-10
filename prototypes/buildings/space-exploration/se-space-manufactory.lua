local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local pipes_lib = require("lib.add-pipes-simple")

local machine_name = "se-space-manufactory"
local machine_type = "assembling-machine"
local pipe_volume = 2000

local pipes_above = {
          filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/se-space-manufactory/pipes-above.png",
            priority = "high",
            width = 577,
            height = 605,
            frame_count = 1,
            line_length = 1,
            repeat_count = 128,
            shift = util.by_pixel(0, -8),
           -- animation_speed = animation_speed,
            scale = 0.5,
}

local pipes_below = {
          filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/se-space-manufactory/pipes-below.png",
            priority = "high",
            width = 577,
            height = 605,
            frame_count = 1,
            line_length = 1,
            repeat_count = 128,
            shift = util.by_pixel(0, -8),
           -- animation_speed = animation_speed,
            scale = 0.5,
}

local new_fluid_boxes =
{
    {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
        { flow_direction = "input-output", position = {-4, 0}, direction = defines.direction.west },
        { flow_direction = "input-output", position = {4, 0}, direction = defines.direction.east }
    },
    secondary_draw_orders = { north = -1 }
    },
     {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
          { flow_direction = "input-output", position = {-4, 2}, direction = defines.direction.west },
        { flow_direction = "input-output", position = {4, 2}, direction = defines.direction.east }
    },
    secondary_draw_orders = { north = -1 }
    },
     {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
          { flow_direction = "input-output", position = {-4, -2}, direction = defines.direction.west },
        { flow_direction = "input-output", position = {4, -2}, direction = defines.direction.east }
    },
    secondary_draw_orders = { north = -1 }
    },
    {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
        { flow_direction = "input-output", position = {0, 4}, direction = defines.direction.south },
        { flow_direction = "input-output", position = {0, -4}, direction = defines.direction.north }
    },
    secondary_draw_orders = { north = -1 }
    },
    {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
        { flow_direction = "input-output", position = {2, 4}, direction = defines.direction.south },
        { flow_direction = "input-output", position = {2, -4}, direction = defines.direction.north }
    },
    secondary_draw_orders = { north = -1 }
    },
    {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
        { flow_direction = "input-output", position = {-2, 4}, direction = defines.direction.south },
        { flow_direction = "input-output", position = {-2, -4}, direction = defines.direction.north }
    },
    secondary_draw_orders = { north = -1 }
    },
}

pipes_lib.add_pipes_simple(machine_name, machine_type, pipes_below, pipes_above)
replace(machine_name, machine_type, new_fluid_boxes)