local replace_func = require("lib.replace-fluidbox")
local logger = require("lib.logger")
local replace = replace_func.replace_fluid_boxes

local machine_name = "oil-refinery"
local machine_type = "assembling-machine"

local pipe_volume = 1000
local pipe_output_multipler = 1/5




local function replace_oil_refinery_graphics(file_name)
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
            filename = "__manual-pipe-passthrough__/graphics/buildings/vanilla/oil-refinery/oil-refinery-alt.png",
            width = 386,
            height = 430,
            shift = util.by_pixel(0, -7.5),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-shadow.png",
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
replace_oil_refinery_graphics()

local vanilla_style =
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
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
            { direction = defines.direction.east, position = { 2,  0} },
            { direction = defines.direction.west, position = {-2,  0} },
        }
    },

    -- Output Box B (top)
    {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
            { direction = defines.direction.east, position = { 2, -1} },
            { direction = defines.direction.west, position = {-2, -1} },
        }
    },

    -- Output Box C (bottom)
    {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
            { direction = defines.direction.east, position = { 2,  1} },
            { direction = defines.direction.west, position = {-2,  1} },
        }
    }
}

local simple_style =
{
        -- Input Box A
    {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections =
        {
            {flow_direction = "input-output",  direction = defines.direction.south, position = {-2,  2} },
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
            {flow_direction = "input-output",  direction = defines.direction.south, position = { 0,  2} },
            {flow_direction = "input-output",  direction = defines.direction.north, position = { 0, -2} }
        }
    },
    {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        pipe_connections =
        {
            {flow_direction = "input-output",  direction = defines.direction.south, position = { 2,  2} },
            {flow_direction = "input-output",  direction = defines.direction.north, position = { 2, -2} },
        }
    },
    -- Output Box A
    -- Output Box A (middle)
    {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
            { direction = defines.direction.east, position = { 2,  0} },
            { direction = defines.direction.west, position = {-2,  0} },
        }
    },

    -- Output Box B (top)
    {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
            { direction = defines.direction.east, position = { 2, -1} },
            { direction = defines.direction.west, position = {-2, -1} },
        }
    },

    -- Output Box C (bottom)
    {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume*pipe_output_multipler,
        pipe_connections = {
            { direction = defines.direction.east, position = { 2,  1} },
            { direction = defines.direction.west, position = {-2,  1} },
        }
    }
}

if settings.startup["vanilla-oil-refinery-alt-skin"].value then
    local file_name = "__manual-pipe-passthrough__/graphics/buildings/vanilla/oil-refinery/oil-refinery-alt.png"
    replace_oil_refinery_graphics(file_name)
    replace(machine_name, machine_type, simple_style)
else
    local file_name = "__manual-pipe-passthrough__/graphics/buildings/vanilla/oil-refinery/oil-refinery-1.png"
    replace_oil_refinery_graphics(file_name)
    replace(machine_name, machine_type, vanilla_style)
end 

