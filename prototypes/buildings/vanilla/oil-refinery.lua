-- Helper functions
local logger = require("lib.logger")
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_name = "oil-refinery"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5




local function replace_oil_refinery_graphics(file_name)
  local refinery = data.raw[machine_type][machine_name]

  if refinery then
      if not refinery then
       logger.error(machine_name .." not found")
    return
  end

    local animation = make_4way_animation_from_spritesheet(
      {
        layers =
        {
          {
            filename = file_name,
            width = 386,
            height = 430,
            shift = util.by_pixel(0, -7.5),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-shadow.png",
            width = 674,
            height = 426,
            shift = util.by_pixel(82.5, 26.5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      })
      refinery.graphics_set.animation = animation
  end
end

-- Vanilla style pipe positions
local vanilla_style_pipe_positions_input = {
    -- Input Box A: south at (-1, 2) and north at (-2, -2)
    {
        { -1,  2 },  -- Bottom-left connection (south-facing)
        { -2, -2 }   -- Top-left connection (north-facing)
    },
    -- Input Box B: south at (1, 2), north at (0, -2), and north at (2, -2)
    {
        {  1,  2 },  -- Bottom-right connection (south-facing)
        {  0, -2 },  -- Top-center connection (north-facing)
        {  2, -2 }   -- Top-right connection (north-facing)
    }
}

local vanilla_style_pipe_positions_output = {
    -- Output Box A (middle): east at (2, 0) and west at (-2, 0)
    {
        {  2,  0 },  -- Right-center connection (east-facing)
        { -2,  0 }   -- Left-center connection (west-facing)
    },
    -- Output Box B (top): east at (2, -1) and west at (-2, -1)
    {
        {  2, -1 },  -- Right-top connection (east-facing)
        { -2, -1 }   -- Left-top connection (west-facing)
    },
    -- Output Box C (bottom): east at (2, 1) and west at (-2, 1)
    {
        {  2,  1 },  -- Right-bottom connection (east-facing)
        { -2,  1 }   -- Left-bottom connection (west-facing)
    }
}

local vanilla_style_pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = vanilla_style_pipe_positions_input,
    pipe_positions_output = vanilla_style_pipe_positions_output,

    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

-- Simple style pipe positions
local simple_style_pipe_positions_input = {
    -- Input Box A: south at (-2, 2) and north at (-2, -2)
    {
        { -2,  2 },  -- Bottom-left connection (south-facing)
        { -2, -2 }   -- Top-left connection (north-facing)
    },
    -- Input Box B: south at (0, 2) and north at (0, -2)
    {
        {  0,  2 },  -- Bottom-center connection (south-facing)
        {  0, -2 }   -- Top-center connection (north-facing)
    },
    -- Input Box C: south at (2, 2) and north at (2, -2)
    {
        {  2,  2 },  -- Bottom-right connection (south-facing)
        {  2, -2 }   -- Top-right connection (north-facing)
    }
}

local simple_style_pipe_positions_output = {
    -- Output Box A (middle): east at (2, 0) and west at (-2, 0)
    {
        {  2,  0 },  -- Right-center connection (east-facing)
        { -2,  0 }   -- Left-center connection (west-facing)
    },
    -- Output Box B (top): east at (2, -1) and west at (-2, -1)
    {
        {  2, -1 },  -- Right-top connection (east-facing)
        { -2, -1 }   -- Left-top connection (west-facing)
    },
    -- Output Box C (bottom): east at (2, 1) and west at (-2, 1)
    {
        {  2,  1 },  -- Right-bottom connection (east-facing)
        { -2,  1 }   -- Left-bottom connection (west-facing)
    }
}

local simple_style_pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = simple_style_pipe_positions_input,
    pipe_positions_output = simple_style_pipe_positions_output,

    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

local alt_skin = settings.startup["vanilla-oil-refinery-alt-skin"].value

local file_name = alt_skin
    and "__manual-pipe-passthrough__/graphics/buildings/vanilla/oil-refinery/oil-refinery-alt.png"
    or "__manual-pipe-passthrough__/graphics/buildings/vanilla/oil-refinery/oil-refinery-1.png"

local pipe_args = alt_skin
    and simple_style_pipe_args
    or vanilla_style_pipe_args

replace_oil_refinery_graphics(file_name)
dh.replace_fluidboxes(machine_name, machine_type, pipe_args)
