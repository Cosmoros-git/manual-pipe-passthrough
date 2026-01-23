-- Helper functions
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local fbh = require("lib.fluid-box-helper")

--K2 references depending on mod.
local pipe_pictures = ""
if K2_PIPE_PICTURES_MOD then
    pipe_pictures =
        require(K2_PIPE_PICTURES_MOD ..
            ".prototypes.buildings.pipe-picture")
end

-- Machine type and name. Can have many names.
local machine_name = "kr-matter-associator"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 500
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    { 0, -3 },  -- Top center input (north-facing)
    { 0,  3 },  -- Bottom center input (south-facing)
}

local pipe_positions_output = {
    { -3, 0 },  -- Left center output (west-facing)
    {  3, 0 },  -- Right center output (east-facing)
}

local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_picture = pipe_pictures,
    pipecoverspictures = pipecoverspictures(),
}
local new_fluid_boxes = fbh.make_pipes(pipe_args)
replace(machine_name, machine_type, new_fluid_boxes)
