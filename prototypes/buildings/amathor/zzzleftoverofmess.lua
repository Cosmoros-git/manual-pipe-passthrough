-- Helper functions
local dh = require("lib.data-helper")

-- Machine type and name. Can have many names.

local machine_names = {
  "apm_assembling_machine_0",  "apm_assembling_machine_1",
  "apm_crusher_machine_0",  "apm_crusher_machine_1",  "apm_crusher_machine_2",
  "apm_press_machine_1","apm_press_machine_2",
  "apm_cocking_plant_0",  "apm_cocking_plant_1",  "apm_cocking_plant_2",
  "apm_centirfuge_0","apm_centirfuge_1","apm_centirfuge_2",
  "apm_greenhouse_0","apm_centirfuge_1","apm_centirfuge_2",
  "apm_puddling_furnace_0",
  "apm_air_cleaner_machine_0","apm_centirfuge_1",
  "apm_sieve_0",
  "apm_steelworks_0","apm_centirfuge_1"
}

local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 200
local pipe_output_multiplier = 1/5

local pipe_positions_input = {
    { 0, -1 },  -- Top input (north-facing)
    { 0,  1 }   -- Bottom input (south-facing)
}

local pipe_positions_output = {
    { -1, 0 },  -- Left output (west-facing) 
    {  1, 0 }   -- Right output (east-facing) 
}
local pipe_args = {
    volume = pipe_volume,
    output_multiplier = pipe_output_multiplier,

    pipe_positions_input = pipe_positions_input,
    pipe_positions_output = pipe_positions_output,

    pipe_picture= nil,
    pipe_covers = pipecoverspictures(),
    secondary_draw_orders = { north = -1 },
}


for _, name in ipairs(machine_names) do
  dh.replace_fluidboxes_copy_pipe_pictures(name, machine_type, pipe_args)
end
