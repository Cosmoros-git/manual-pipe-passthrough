-- Helper functions
local dh = require("lib.data-helper")
local pipepictures2
local pipepictures3

if mods["Assembler-Reskin"] then 
    require("__Assembler-Reskin__.prototypes.assemblerpipes") 
    pipepictures2 = spassembler2pipepictures()
    pipepictures3 = spassembler3pipepictures()
else
    pipepictures2 = assembler2pipepictures()
    pipepictures3 = assembler3pipepictures()
end
-- Machine type and name. Can have many names.
local machine_name_2= "assembling-machine-2"
local machine_name_3= "assembling-machine-3"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 500
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    { 0, -1 },  -- Top input (north-facing)
    { 0,  1 }   -- Bottom input (south-facing)
}

local pipe_positions_output = {
    { -1, 0 },  -- Left output (west-facing) 
    {  1, 0 }   -- Right output (east-facing) 
}
local pipe_args_2 = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_picture = pipepictures2,
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
    always_draw_covers =false
}
local pipe_args_3 = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_picture = pipepictures3,
    pipecoverspictures = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
    always_draw_covers =false
}

dh.replace_fluidboxes(machine_name_2, machine_type, pipe_args_2)
dh.replace_fluidboxes(machine_name_3, machine_type, pipe_args_3)
