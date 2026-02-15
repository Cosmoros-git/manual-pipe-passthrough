-- Helper functions
local logger = require("lib.logger")
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.
local machine_name = "chemical-plant"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 500
local pipe_output_multiplier = 1/5

local function replace_4way_animation()
  local refinery = data.raw[machine_type][machine_name]

  if refinery then
      if not refinery then
    logger.error(machine_name .." not found")
    return
  end
    animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__manual-pipe-passthrough__/graphics/buildings/vanilla/chemical-plant/pipes-below.png",
          width = 220,
          height = 292,
          frame_count = 1,
          repeat_count = 24,
          line_length = 1,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
         {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
          width = 220,
          height = 292,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
        {
          filename = "__manual-pipe-passthrough__/graphics/buildings/vanilla/chemical-plant/pipes-above.png",
          width = 220,
          height = 292,
          frame_count = 1,
          repeat_count = 24,
          line_length = 1,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
          width = 312,
          height = 222,
          repeat_count = 24,
          shift = util.by_pixel(27, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }})
      refinery.graphics_set.animation = animation
  end
end
replace_4way_animation()

local pipe_positions_input = {
    -- Left column inputs
    { -1, -1 },  -- Top-left input (north-facing)
    { -1,  1 },  -- Bottom-left input (south-facing)
    -- Right column inputs
    {  1, -1 },  -- Top-right input (north-facing)
    {  1,  1 }   -- Bottom-right input (south-facing)
}

local pipe_positions_output = {
    -- Center column outputs - reduced volume
    {  0, -1 },  -- Top-center output (north-facing) - reduced volume
    {  0,  1 },  -- Bottom-center output (south-facing) - reduced volume
    -- Horizontal outputs - reduced volume
    {  1,  0 },  -- Right-center output (east-facing) - reduced volume
    { -1,  0 }   -- Left-center output (west-facing) - reduced volume
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,
    
    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

dh.replace_fluidboxes(machine_name, machine_type, pipe_args)
