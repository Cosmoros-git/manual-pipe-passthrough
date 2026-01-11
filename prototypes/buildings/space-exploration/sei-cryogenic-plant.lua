local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

local machine_name = "cryogenic-plant"
local machine_type = "assembling-machine"

local pipe_volume = 1000
local pipe_output_multipler = 1/5





local pipe_width = 380
local pipe_hight = 396
local frames = 1
local repeated = 192
local function pipe_above()
  return {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-age/cryogenic-plant/pipes-above.png",
    width = pipe_width,
    height = pipe_hight,
    frame_count = frames,
    repeat_count = repeated,
    scale = 0.5,
    shift = util.by_pixel(3, -4)
  }
end
local function pipe_above_2()
  return {
    filename = "__manual-pipe-passthrough__/graphics/buildings/space-age/cryogenic-plant/pipes-above-2.png",
    width = pipe_width,
    height = pipe_hight,
    frame_count = frames,
    repeat_count = repeated,
    scale = 0.5,
    shift = util.by_pixel(3, -4)
  }
end

local function build_layers_sides(old_layers)
  local layers = {}

  -- base sprite
  table.insert(layers, old_layers[1])

  -- pipes
  table.insert(layers, pipe_above())

  -- everything else (skip layer 1)
  for i = 2, #old_layers do
    table.insert(layers, old_layers[i])
  end

  return layers
end

local function build_layers_tops(old_layers)
  local layers = {}

  table.insert(layers, old_layers[1])


  table.insert(layers, pipe_above_2())

  for i = 2, #old_layers do
    table.insert(layers, old_layers[i])
  end

  return layers
end

local function machine_animation(old_anim)
  return {
    north = { layers = build_layers_tops(old_anim.layers) },
    south = { layers = build_layers_tops(old_anim.layers) },
    east  = { layers = build_layers_sides(old_anim.layers) },
    west  = { layers = build_layers_sides(old_anim.layers) },
  }
end

local function prepend_layer()
  local entity = data.raw[machine_type] and data.raw[machine_type][machine_name]
  if not entity or not entity.graphics_set or not entity.graphics_set.animation then
    log(machine_name .. " not found graphics.")
    return
  end

  local old_anim = entity.graphics_set.animation
  entity.graphics_set.animation = machine_animation(old_anim)
end
prepend_layer()

-- Screw custom pipe_pictures
local entity = data.raw[machine_type] and data.raw[machine_type][machine_name]
  if entity then
        entity.fluid_boxes_off_when_no_fluid_recipe = false
  else
end

local pipe_picture = require("__sei-cryogenic-plant__.prototypes.entity.cryogenic-plant-pictures").pipe_picture
local pipe_picture_frozen = require("__sei-cryogenic-plant__.prototypes.entity.cryogenic-plant-pictures").pipe_picture_frozen

-- Fuck them pipe pictures, fuck that stupid thing. Im adding my own shit.

local new_fluid_boxes =
{
    {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    always_draw_covers = true,
    volume = pipe_volume*pipe_output_multipler,
    pipe_connections = {
        { flow_direction="input-output", direction = defines.direction.north, position = {  0, -2 } },
        { flow_direction="input-output", direction = defines.direction.south, position = {  0,  2 } }
    },
    },
    {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    always_draw_covers = true,
    pipe_connections = {
        { flow_direction="input-output", direction = defines.direction.north, position = { -2, -2 } },
    }
    },
    {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    always_draw_covers = true,
    pipe_connections = {
        { flow_direction="input-output", direction = defines.direction.south, position = { -2,  2 } },
    }
    },
    {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    always_draw_covers = true,
    pipe_connections = {
        { flow_direction="input-output", direction = defines.direction.north, position = {  2, -2 } },
    }
    },
    {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = pipe_volume,
    always_draw_covers = true,
    pipe_connections = {
        { flow_direction="input-output", direction = defines.direction.south, position = {  2,  2 } },
    }
    },
    {
    production_type = "output",
    volume = pipe_volume*pipe_output_multipler,
    always_draw_covers = true,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {
        { flow_direction="input-output", direction = defines.direction.west, position = { -2, 0 } },
    }
    },
    {
    production_type = "output",
    volume = pipe_volume*pipe_output_multipler,
    always_draw_covers = true,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {
        { flow_direction="input-output", direction = defines.direction.east, position = {  2, 0 } },
    }
    },
}


replace(machine_name, machine_type, new_fluid_boxes)