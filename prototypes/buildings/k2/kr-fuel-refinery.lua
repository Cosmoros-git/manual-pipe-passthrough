local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

local machine_name = "kr-fuel-refinery"
local machine_type = "assembling-machine"
local pipe_volume = 2000

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

local new_fluid_boxes =
{
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = {
          { flow_direction = "input-output", direction = defines.direction.north, position = { -1, -1 } },
          { flow_direction = "input-output", direction = defines.direction.south, position = { -1,  1 } },
          
        
        },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections = {
          { flow_direction = "input-output", direction = defines.direction.south, position = {  1,  1 } },
          { flow_direction = "input-output", direction = defines.direction.north, position = {  1, -1 } },
        },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_pictures =assembler2pipepictures(),
        volume = pipe_volume,
        pipe_connections = {
        { flow_direction = "input-output", direction = defines.direction.east, position = { 1, 0 } },
        { flow_direction = "input-output", direction = defines.direction.west, position = { -1, 0 } } },
      },
}

replace(machine_name, machine_type, new_fluid_boxes)
