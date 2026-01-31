
-- Helper functions
local logger = require("lib.logger")
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local fbh = require("lib.fluid-box-helper")

M = {}

function M.get_machine(machine_name, machine_type)
    if not machine_name or not machine_type then
        logger.error("data-helper missing required parameters.")
        return nil
    end

    local machine = data.raw[machine_type] and data.raw[machine_type][machine_name]
    if not machine then
        logger.error("Machine '" .. machine_name .. "' of type '" .. machine_type .. "' not found!")
        return nil
    end
    logger.info("Machine '" .. machine_name .. "' of type '" .. machine_type .. "' processing!")
    return machine
end

function M.replace_fluidboxes(machine_name, machine_type,pipe_args)
    local machine = M.get_machine(machine_name,machine_type)
    if machine then
        local input_rules, output_rules = fbh.extract_connection_rules(machine)
        local new_fluid_boxes = fbh.make_pipes(pipe_args, {
            input_rules = input_rules,
            output_rules = output_rules
        })
        replace(machine, new_fluid_boxes)
    end
end

return M