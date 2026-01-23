
-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

-- Machine type and name. Can be many names
local machine_name = "kr-fuel-refinery"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
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
            filename = "__manual-pipe-passthrough__/graphics/buildings/kr/fuel-refinery/pipes-below.png",
            width = 244,
            height = 268,
            frame_count = 1,
            shift = util.by_pixel(-5, -4.5),
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/buildings/fuel-refinery/fuel-refinery.png",
            width = 244,
            height = 268,
            frame_count = 1,
            shift = util.by_pixel(-5, -4.5),
            scale = 0.5,
          },
          {
            filename = "__manual-pipe-passthrough__/graphics/buildings/kr/fuel-refinery/pipes-above.png",
            width = 244,
            height = 268,
            frame_count = 1,
            shift = util.by_pixel(-5, -4.5),
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/buildings/fuel-refinery/fuel-refinery-shadow.png",
            width = 350,
            height = 219,
            frame_count = 1,
            shift = util.by_pixel(31.5, 10.75),
            draw_as_shadow = true,
            scale = 0.5,
          },
        }
      })
      refinery.graphics_set.animation = animation
  end
end
replace_4way_graphics()

local pipe_positions_input = {
    -- First input box: north at (-1, -1) and south at (-1, 1)
    {
        { -1, -1 },  -- north connection
        { -1,  1 }   -- south connection
    },
    -- Second input box: south at (1, 1) and north at (1, -1)  
    {
        {  1,  1 },  -- south connection
        {  1, -1 }   -- north connection
    }
}

local pipe_positions_output = {
    -- Output box: east at (1, 0) and west at (-1, 0)
    {
        { 1, 0 },    -- east connection
        { -1, 0 }    -- west connection
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