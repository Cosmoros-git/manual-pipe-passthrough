-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local pipes_lib = require("lib.add-pipes-simple")

-- Machine type and name. Can have many names.
local machine_name = "se-space-manufactory"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5


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

local pipe_positions_input = {
    -- Input box 1: west at (-4, 0) and east at (4, 0)
    {
        { -4, 0 },  -- Left center connection (west-facing)
        {  4, 0 }   -- Right center connection (east-facing)
    },
    -- Input box 2: west at (-4, 2) and east at (4, 2)
    {
        { -4, 2 },  -- Left top connection (west-facing)
        {  4, 2 }   -- Right top connection (east-facing)
    },
    -- Input box 3: west at (-4, -2) and east at (4, -2)
    {
        { -4, -2 },  -- Left bottom connection (west-facing)
        {  4, -2 }   -- Right bottom connection (east-facing)
    }
}

local pipe_positions_output = {
    -- Output box 1: south at (0, 4) and north at (0, -4) - reduced volume
    {
        { 0,  4 },  -- Bottom center connection (south-facing)
        { 0, -4 }   -- Top center connection (north-facing)
    },
    -- Output box 2: south at (2, 4) and north at (2, -4) - reduced volume
    {
        { 2,  4 },  -- Bottom right connection (south-facing)
        { 2, -4 }   -- Top right connection (north-facing)
    },
    -- Output box 3: south at (-2, 4) and north at (-2, -4) - reduced volume
    {
        { -2,  4 },  -- Bottom left connection (south-facing)
        { -2, -4 }   -- Top left connection (north-facing)
    }
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,
    
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

local new_fluid_boxes = fbh.make_pipes(pipe_args)
pipes_lib.add_pipes_simple(machine_name, machine_type, pipes_below, pipes_above)
replace(machine_name,machine_type,new_fluid_boxes)