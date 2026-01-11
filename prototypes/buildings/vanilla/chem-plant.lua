local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

local machine_name = "chemical-plant"
local machine_type = "assembling-machine"

local pipe_volume = 500
local pipe_output_multipler = 1/5

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
          filename = "__manual-pipe-passthrough__/graphics/buildings/vanilla/chemical-plant/pipes-below-v3.png",
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
          filename = "__manual-pipe-passthrough__/graphics/buildings/vanilla/chemical-plant/pipes-above-v3.png",
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

local new_fluid_boxes =
{
  -- 1) North input  ↔  South input   (left)
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.north, position = { -1, -1 } }
    }
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.south, position = { -1,  1 } }
    }
  },

  -- 2) North output ↔ South output   (center)
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.north, position = {  0, -1 } }
    }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.south, position = {  0,  1 } }
    }
  },

  -- 3) North input ↔ South input   (right)
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.north, position = {  1, -1 } }
    }
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.south, position = {  1,  1 } }
    }
  },

  -- 4) East output ↔ West output  (top)
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.east, position = {  1, 0 } }
    }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
      { flow_direction="input-output", direction = defines.direction.west, position = { -1, 0 } }
    }
  },
}


replace(machine_name, machine_type, new_fluid_boxes)
