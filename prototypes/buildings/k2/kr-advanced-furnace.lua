
-- Helper functions
local replace_func = require("lib.replace-fluidbox")
local pipe_pictures = ""
local fbh = require("lib.fluid-box-helper")

--K2 references depending on mod.
if K2_PIPE_PICTURES_MOD then
    pipe_pictures =
        require(K2_PIPE_PICTURES_MOD ..
            ".prototypes.buildings.advanced-furnace-pipe-pictures")
end
local replace = replace_func.replace_fluid_boxes

-- Machine type and name. Can be many names
local machine_name = "kr-advanced-furnace"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 1000
local pipe_output_multiplier = 1/5

local common_pipe_args_input = {
        pipe_covers     = pipecoverspictures(),
        secondary_draw_orders = { north = -1 },
        production_type = "input",
        volume = pipe_volume,
}
local common_pipe_args_output = {
        pipe_covers     = pipecoverspictures(),
        secondary_draw_orders = { north = -1 },
        production_type   = "output",
        volume            = pipe_volume,
        output_multiplier = pipe_output_multiplier,
}

local function input_pipe(args)
    return fbh.make_pipe(merge(common_pipe_args_input,args))
end

local function output_pipe(args)
    return fbh.make_pipe(merge(common_pipe_args_output,args))
end

local new_fluid_boxes = {
    -- INPUTS
    
    -- First input: right side, slightly above center
    input_pipe{
        pipe_pictures = pipe_pictures.a,  -- Uses pipe picture set 'a'
        position      = {  3, -1 },       -- Right, above center connection (east-facing)
    },

    -- Second input: left side, top
    input_pipe{
        pipe_pictures = pipe_pictures.a,  -- Uses pipe picture set 'a'
        position      = { -1, -3 },       -- Left, top connection (north-facing)
    },

    -- Third input: dual-connection box
    input_pipe{
        pipe_pictures = pipe_pictures.b,  -- Uses pipe picture set 'b'
        position = {
            {  1, -3 },  -- Right, top connection (north-facing)
            { -3, -1 },  -- Left, above center connection (west-facing)
        },
    },

    -- OUTPUTS
    
    -- First output: left side, bottom
    output_pipe{
        pipe_pictures = pipe_pictures.b,  -- Uses pipe picture set 'b'
        position      = { -1,  3 },       -- Left, bottom connection (south-facing)
    },

    -- Second output: right side, slightly below center
    output_pipe{
        pipe_pictures = pipe_pictures.b,  -- Uses pipe picture set 'b'
        position      = {  3,  1 },       -- Right, below center connection (east-facing)
    },

    -- Third output: dual-connection box
    output_pipe{
        pipe_pictures = pipe_pictures.a,  -- Uses pipe picture set 'a'
        position = {
            {  1,  3 },  -- Right, bottom connection (south-facing)
            { -3,  1 },  -- Left, below center connection (west-facing)
        },
    },
}
replace(machine_name, machine_type, new_fluid_boxes)
