-- Helper functions
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local pipes_lib = require("lib.add-pipes-simple")
local replace = replace_func.replace_fluid_boxes

-- Machine type and name. Can have many names.
-- Machines that need pipes fixed. Sprite-wise.
local machines_add_pipes = {
  "se-space-thermodynamics-laboratory",
  "se-space-radiation-laboratory",
  "se-space-laser-laboratory",
}
-- I did this a while ago and it confused even me. It's just 3 need pipe graphics fixes, others dont.
local plasma_gen = "se-space-plasma-generator"
local electro_lab = "se-space-electromagnetics-laboratory"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 500
local pipe_output_multiplier = 1/5

local pipes_below = {
 filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/laser-rad-thermal/pipes-below.png",
      width = 448,
      height = 480,
      frame_count = 1,
      repeat_count = 64,
      shift = util.by_pixel(0, -24),
      scale = 0.5,
      draw_as_underlay = true,
}
local pipes_above = {
   filename = "__manual-pipe-passthrough__/graphics/buildings/space-exploration/laser-rad-thermal/pipes-above.png",
      width = 448,
      height = 480,
      frame_count = 1,
      repeat_count = 64,
      shift = util.by_pixel(0, -24),
      scale = 0.5,
}

local pipe_positions_input = {
    { 0, -3 },  -- Top center input (north-facing)
    { 0,  3 }   -- Bottom center input (south-facing)
}

local pipe_positions_output = {
    { -3, 0 },  -- Left center output (west-facing) 
    {  3, 0 }   -- Right center output (east-facing) 
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,
    
    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,
    
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}

local new_fluid_boxes = fbh.make_pipes(pipe_args)
for _, name in ipairs(machines_add_pipes) do
  replace(name, machine_type, new_fluid_boxes)
  pipes_lib.add_pipes_simple(name, machine_type, pipes_below, pipes_above)
end

replace(plasma_gen, machine_type, new_fluid_boxes)
replace(electro_lab, machine_type, new_fluid_boxes)

-- Electromagneitc and Plasma gen dont need new pipes. However electro_lab needs at least 2 outputs.