-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes

-- Machine type and name. Can have many names.
local machine_name = "cryogenic-plant"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5


-- Cryo-thingy was absolute pain to make work. 
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
-- Fuck them pipe pictures, fuck that stupid thing. Im doing my own shit. I SPENT A DAY. FUCK THAT SHIT.

local pipe_positions_input = {
    -- Input 1: north at (-2, -2)
    { -2, -2 },  -- Top-left input (north-facing)
    -- Input 2: south at (-2, 2)
    { -2,  2 },  -- Bottom-left input (south-facing)
    -- Input 3: north at (2, -2)
    {  2, -2 },  -- Top-right input (north-facing)
    -- Input 4: south at (2, 2)
    {  2,  2 }   -- Bottom-right input (south-facing)
}

local pipe_positions_output = {
    -- Output box 1: north at (0, -2) and south at (0, 2) - reduced volume
    {
        {  0, -2 },  -- Top center connection (north-facing)
        {  0,  2 }   -- Bottom center connection (south-facing)
    },
    -- Output 2: west at (-2, 0) - reduced volume
    { -2,  0 },  -- Left center output (west-facing) - reduced volume
    -- Output 3: east at (2, 0) - reduced volume
    {  2,  0 }   -- Right center output (east-facing) - reduced volume
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,
    
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
    always_draw_covers = true,
}

local new_fluid_boxes = fbh.make_pipes(pipe_args)
replace(machine_name, machine_type, new_fluid_boxes)