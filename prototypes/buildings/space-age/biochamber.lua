-- Helper functions
local dh = require("lib.data-helper")
local fbh = require("lib.fluid-box-helper")
local replace_func = require("lib.replace-fluidbox")
local replace = replace_func.replace_fluid_boxes
local logger = require("lib.logger")

-- Machine type and name. Can have many names.
local machine_name = "biochamber"
local machine_type = "assembling-machine"

-- Pipe volume and output multiplier. Smaller output pipes output liquids much faster.
local pipe_volume = 500
local pipe_output_multiplier = 1/5

-- Pipe pictures depending on mods


local biochamber_pictures =  
     mods["sei-biochamber"] and require("__sei-biochamber__.prototypes.entity.biochamber-pictures")
    or mods["space-age"] and require("__space-age__.prototypes.entity.biochamber-pictures")
    or nil
if not biochamber_pictures then
  logger.warn("Biochamber pictures not found (sei-biochamber/space-age not active). Skipping biochamber fluidbox patch.")
  return
end


-- If someone decided to take a look at this and  will notice its not like the others... 
-- ITS BECAUSE IT ISNT. WHAT IS THIS SHIT?
-- Cryogenic plant had one type of pipe pictures, this thing has another... like wth.

local function replace_fluidboxes_biochamber(machine_name, machine_type)
  local function patch(m)
    local input_rules, output_rules = fbh.extract_connection_rules(m)
    local fluid_boxes = {
      -- TOP-LEFT: INPUT (north)
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        connection_rules = input_rules,
        pipe_connections = {{
          flow_direction = "input-output",
          direction = defines.direction.north,
          position = {-1, -1}
        }}
      },

      -- TOP-RIGHT: OUTPUT (north)
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume * pipe_output_multiplier,
        connection_rules = output_rules,
        pipe_connections = {{
          flow_direction = "input-output",
          direction = defines.direction.north,
          position = {1, -1}
        }}
      },

      -- BOTTOM-LEFT: INPUT (south)
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume,
        connection_rules = input_rules,
        pipe_connections = {{
          flow_direction = "input-output",
          direction = defines.direction.south,
          position = {-1, 1}
        }}
      },

      -- BOTTOM-RIGHT: OUTPUT (south)
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = pipe_volume * pipe_output_multiplier,
        connection_rules = output_rules,
        pipe_connections = {{
          flow_direction = "input-output",
          direction = defines.direction.south,
          position = {1, 1}
        }}
      },
    }
      
    replace(m, fluid_boxes)
  end

  local machine = dh.get_machine(machine_name, machine_type)
  if machine then
    patch(machine)
  end

  -- Should work on QAM machines. If they exist. If they dont, it will do nothin.
  if QAM_ENABLED then
      local qam_name = QAM_PREFIX .. machine_name .. QAM_SUFFIX
      local qam_machine = dh.get_machine(qam_name, machine_type)
      if qam_machine then
        patch(qam_machine)
    end
  end
end

replace_fluidboxes_biochamber(machine_name, machine_type)