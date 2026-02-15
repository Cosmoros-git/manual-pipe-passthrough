-- Helper functions
local pipes_lib = require("lib.add-pipes-simple")
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_names = {
  "se-space-material-fabricator",
  "se-space-particle-collider",
  "se-space-particle-accelerator",
}
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5

local pipes_above = {
            filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/particle-acc-col/pipes-above.png",
            width = 590,
            height = 672,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            shift = util.by_pixel(0, -8),
            scale = 0.5,
}

local pipes_below = {
            filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/particle-acc-col/pipes-below.png",
            width = 590,
            height = 672,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            shift = util.by_pixel(0, -8),
            scale = 0.5,
}
local pipe_positions_input = {
    -- First input box: north at (1, -4) and south at (1, 4)
    {
        { 1, -4 },  -- Top connection (north-facing)
        { 1,  4 }   -- Bottom connection (south-facing)
    },
    -- Second input box: north at (-1, -4) and south at (-1, 4)
    {
        { -1, -4 },  -- Top connection (north-facing)
        { -1,  4 }   -- Bottom connection (south-facing)
    },
    -- Third input box: north at (0, -4) and south at (0, 4)
    {
        { 0, -4 },  -- Top center connection (north-facing)
        { 0,  4 }   -- Bottom center connection (south-facing)
    }
}

local pipe_positions_output = {
    -- First output box: west at (-4, 0) and east at (4, 0)
    {
        { -4, 0 },  -- Left center connection (west-facing)
        {  4, 0 }   -- Right center connection (east-facing)
    },
    -- Second output box: west at (-4, 1) and east at (4, 1)
    {
        { -4, 1 },  -- Left top connection (west-facing)
        {  4, 1 }   -- Right top connection (east-facing)
    },
    -- Third output box: west at (-4, -1) and east at (4, -1)
    {
        { -4, -1 },  -- Left bottom connection (west-facing)
        {  4, -1 }   -- Right bottom connection (east-facing)
    }
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,
    
    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}
for _, name in ipairs(machine_names) do
    dh.replace_fluidboxes(name, machine_type, pipe_args)
    pipes_lib.add_pipes_simple_to_animation(name, machine_type, pipes_below, pipes_above)
end