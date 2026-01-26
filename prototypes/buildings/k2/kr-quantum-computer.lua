-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local pipes_lib = require("lib.add-pipes-simple")

-- Machine type and name. Can have many names.
local machine_name = "kr-quantum-computer"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 500
local pipe_output_multiplier = 1/5

-- Graphics for pipes.
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

local pipe_positions_input = {
    -- First input box: west at (-2.5, -0.5) and east at (2.5, -0.5)
    {
        { -2.5, -0.5 },  -- Left connection (west-facing)
        {  2.5, -0.5 }   -- Right connection (east-facing)
    },
    -- Second input box: west at (-2.5, 0.5) and east at (2.5, 0.5)
    {
        { -2.5,  0.5 },  -- Left connection (west-facing)
        {  2.5,  0.5 }   -- Right connection (east-facing)
    }
}

local pipe_positions_output = {
    -- First output box: north at (-0.5, -2.5) and south at (-0.5, 2.5)
    {
        { -0.5, -2.5 },  -- Top connection (north-facing)
        { -0.5,  2.5 }   -- Bottom connection (south-facing)
    },
    -- Second output box: north at (0.5, -2.5) and south at (0.5, 2.5)
    {
        {  0.5, -2.5 },  -- Top connection (north-facing)
        {  0.5,  2.5 }   -- Bottom connection (south-facing)
    }
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
    always_draw_covers = true
}
local new_fluid_boxes = fbh.make_pipes(pipe_args)

pipes_lib.add_pipes_simple(machine_name, machine_type, pipes_below, nil)
replace(machine_name, machine_type, new_fluid_boxes)