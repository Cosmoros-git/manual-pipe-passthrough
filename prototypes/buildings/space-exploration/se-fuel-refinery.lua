
-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

-- Machine type and name. Can have many names.
local machine_name = "se-fuel-refinery"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 2000
local pipe_output_multipler = 1/5

-- Function that I used to edit sprites without license issues.
local function replace_4way_graphics()
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
            filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/se-fuel-refinery/pipes-below.png",
            width = 386,
            height = 430,
            shift = util.by_pixel(0, -7.5),
            scale = 0.5
          },
          {
            filename = "__space-exploration-graphics-5__/graphics/entity/fuel-refinery/fuel-refinery.png",
            width = 386,
            height = 430,
            shift = util.by_pixel(0, -7.5),
            scale = 0.5
          },
          { 
            filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/se-fuel-refinery/pipes-above.png",
            width = 386,
            height = 430,
            shift = util.by_pixel(0, -7.5),
            scale = 0.5
          },
          {
            filename = "__space-exploration-graphics-5__/graphics/entity/fuel-refinery/fuel-refinery-shadow.png",
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
replace_4way_graphics()

local pipe_positions_input = {
    -- Input Box A: south at (-1, 2) and north at (-2, -2)
    {
        { -1,  2 },  -- Bottom connection (south-facing)
        { -2, -2 }   -- Top connection (north-facing)
    },
    -- Input Box B: south at (1, 2), north at (0, -2), and north at (2, -2)
    {
        {  1,  2 },  -- Bottom connection (south-facing)
        {  0, -2 },  -- Top-left connection (north-facing)
        {  2, -2 }   -- Top-right connection (north-facing)
    }
}

local pipe_positions_output = {
    -- Output Box A: east at (2, 0) and west at (-2, 0)
    {
        {  2,  0 },  -- Right connection (east-facing)
        { -2,  0 }   -- Left connection (west-facing)
    }
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipecoverspictures = pipecoverspictures(),
}

local new_fluid_boxes = fbh.make_pipes(pipe_args)
replace(machine_name, machine_type, new_fluid_boxes)
