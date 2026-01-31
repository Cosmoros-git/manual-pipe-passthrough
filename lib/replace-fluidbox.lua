local logger = require("lib.logger")

local M = {}

function M.replace_fluid_boxes(machine, new_fluid_boxes)
    if not machine or not new_fluid_boxes then
        logger.error("replace_fluid_boxes missing required parameters.")
        return false
    end
    -- Save old
    local old_fluid_boxes = machine.fluid_boxes
    local old_input_box = machine.input_fluid_box
    local old_output_box = machine.output_fluid_box

    -- Clear old
    machine.fluid_boxes = nil
    machine.input_fluid_box = nil
    machine.output_fluid_box = nil

    -- Assign new
    machine.fluid_boxes = new_fluid_boxes

    if not machine.fluid_boxes then
        logger.error("Failed to set new fluid boxes!")
        machine.fluid_boxes = old_fluid_boxes
        machine.input_fluid_box = old_input_box
        machine.output_fluid_box = old_output_box
        return false
    end

    return true
end

return M
