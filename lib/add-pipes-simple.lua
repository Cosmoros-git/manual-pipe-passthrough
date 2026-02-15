local logger = require("lib.logger")
local dh = require("lib.data-helper")

local M = {}

function M.add_pipes_simple_to_animation(machine_name, machine_type, pipes_under, pipes_above)

  local function patch(entity_name, machine)
    if not machine or not machine.graphics_set or not machine.graphics_set.animation then
      logger.error(entity_name .. " not found graphics.")
      return
    end

    local old_anim = machine.graphics_set.animation
    local old_layers = old_anim.layers

    -- If animation has no layers warps it around in a layer.
    if not old_layers then
      old_layers = { old_anim }
    end

    if not old_layers[1] then
      logger.error(entity_name .. " animation has no base layer.")
      return
    end

    local new_layers = {}

    if pipes_under then table.insert(new_layers, pipes_under) end
    table.insert(new_layers, old_layers[1])
    if pipes_above then table.insert(new_layers, pipes_above) end

    for i = 2, #old_layers do
      table.insert(new_layers, old_layers[i])
    end

    -- Preserve other old_anim fields if it already had them (when layered)
    old_anim.layers = new_layers
    machine.graphics_set.animation = old_anim

    logger.info(entity_name .. " Animation Fixed.")
  end

  local machine = dh.get_machine(machine_name, machine_type)
  if machine then
    patch(machine_name, machine)
  end

  if QAM_ENABLED then
    local qam_name = QAM_PREFIX .. machine_name .. QAM_SUFFIX
    local qam_machine = dh.get_machine(qam_name, machine_type)
    if qam_machine then
      patch(qam_name, qam_machine)
    end
  end
end

return M
