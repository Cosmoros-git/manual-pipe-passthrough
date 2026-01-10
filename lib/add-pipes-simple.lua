local logger = require("lib.logger")

local M = {}

function M.add_pipes_simple(machine_name, machine_type, pipes_under, pipes_above)
  local entity = data.raw[machine_type] and data.raw[machine_type][machine_name]
  if not entity or not entity.graphics_set or not entity.graphics_set.animation then
    logger.error(machine_name .. " not found graphics.")
    return
  end

  local old_anim = entity.graphics_set.animation
  local old_layers = old_anim.layers
  local new_layers = {}

  -- Optional: pipes under
  if pipes_under then
    table.insert(new_layers, pipes_under)
  end

  -- Original base layer (required)
  table.insert(new_layers, old_layers[1])

  -- Optional: pipes above
  if pipes_above then
    table.insert(new_layers, pipes_above)
  end

  -- Preserve remaining original layers (shadow, glow, etc.)
  for i = 2, #old_layers do
    table.insert(new_layers, old_layers[i])
  end

  entity.graphics_set.animation = {
    layers = new_layers
  }

  logger.info(machine_name .. " Animation Fixed.")
end

return M