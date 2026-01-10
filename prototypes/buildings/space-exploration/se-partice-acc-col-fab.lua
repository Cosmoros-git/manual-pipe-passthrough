local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

local machine_names = {
  "se-space-material-fabricator",
  "se-space-particle-collider",
  "se-space-particle-accelerator",
}

local machine_type = "assembling-machine"
local pipe_volume = 1000



local function pipe_above(x)
  return {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/particle-acc-col/pipes-above.png",
    width = 590,
    height = 672,
    x = x,     -- 0 or 448
    y = 0,
    shift = util.by_pixel(0, -8),
    frame_count = 1,
    repeat_count = 32,
    scale = 0.5,
  }
end
local function pipe_below(x)
  return {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/particle-acc-col/pipes-below.png",
    width = 590,
    height = 672,
    x = x,     -- 0 or 448
    y = 0,
    shift = util.by_pixel(0, -8),
    frame_count = 1,
    repeat_count = 32,
    scale = 0.5,
  }
end

local function dir_layers_no_anim(pipe_x,machine_anim,shadow_anim)
  return {
    layers = {
      pipe_below(pipe_x),
      machine_anim,
      pipe_above(pipe_x),
      shadow_anim,
    }
  }
end

local function machine_animation(machine_anim,shadow_anim)
  return {
    north = dir_layers_no_anim(0,machine_anim,shadow_anim),
    south = dir_layers_no_anim(0,machine_anim,shadow_anim),
    east = dir_layers_no_anim(590,machine_anim,shadow_anim),
    west = dir_layers_no_anim(590,machine_anim,shadow_anim),
  }
end

local function prepend_layer(machine_name, machine_type)
  local entity = data.raw[machine_type] and data.raw[machine_type][machine_name]
  if not entity or not entity.graphics_set or not entity.graphics_set.animation then
    logger.error(machine_name .. " not found graphics.")
    return
  end

local old_anim = entity.graphics_set.animation
entity.graphics_set.animation = machine_animation(old_anim.layers[1],old_anim.layers[2])

logger.info(machine_name .. " Animation Fixed.")
end

local new_fluid_boxes = {
       {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          volume = pipe_volume,
          pipe_connections = {
            { flow_direction="input-output", position = {1, -4}, direction = defines.direction.north },
            { flow_direction="input-output", position = {1, 4}, direction = defines.direction.south },
          },
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          volume = pipe_volume,
          pipe_connections = {
            { flow_direction="input-output", position = {-1, -4}, direction = defines.direction.north },
            { flow_direction="input-output", position = {-1, 4}, direction = defines.direction.south },
          },
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          volume = pipe_volume,
          pipe_connections = {
            { flow_direction="input-output", position = {0, -4}, direction = defines.direction.north },
            { flow_direction="input-output", position = {0, 4}, direction = defines.direction.south },
          },
          secondary_draw_orders = { north = -1 }
      },
      {
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          volume = pipe_volume,
          pipe_connections = {
            { flow_direction="input-output", position = {-4, 0}, direction = defines.direction.west },
            { flow_direction="input-output", position = {4, 0}, direction = defines.direction.east },
          },
          secondary_draw_orders = { north = -1 }
      },
        {
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          volume = pipe_volume,
          pipe_connections = {
            { flow_direction="input-output", position = {-4, 1}, direction = defines.direction.west },
            { flow_direction="input-output", position = {4, 1}, direction = defines.direction.east },
          },
          secondary_draw_orders = { north = -1 }
      },
        {
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          volume = pipe_volume,
          pipe_connections = {
            { flow_direction="input-output", position = {-4, -1}, direction = defines.direction.west },
            { flow_direction="input-output", position = {4, -1}, direction = defines.direction.east },
          },
          secondary_draw_orders = { north = -1 }
      },
  }


for _, name in ipairs(machine_names) do
  replace(name, machine_type, new_fluid_boxes)
  prepend_layer(name, machine_type)
end
