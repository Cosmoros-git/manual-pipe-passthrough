local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

local machine_name = "se-fuel-refinery"
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

local new_fluid_boxes =
{
        -- Input Box A
    {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections =
        {
            {flow_direction = "input-output",  direction = defines.direction.south, position = {-1,  2} },
            {flow_direction = "input-output",  direction = defines.direction.north, position = {-2, -2} },
        }
    },
        -- Input Box B
    {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections =
        {
            {flow_direction = "input-output",  direction = defines.direction.south, position = { 1,  2} },
            {flow_direction = "input-output",  direction = defines.direction.north, position = { 0, -2} },
            {flow_direction = "input-output",  direction = defines.direction.north, position = { 2, -2} },
        }
    },
    -- Output Box A
    -- Output Box A (middle)
    {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*2,
        pipe_connections = {
            {flow_direction = "input-output", direction = defines.direction.east, position = { 2,  0} },
            {flow_direction = "input-output", direction = defines.direction.west, position = {-2,  0} },
        }
    },
}

replace(machine_name, machine_type, new_fluid_boxes)
