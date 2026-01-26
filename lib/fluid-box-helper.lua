local M = {}

-- Map position → direction automatically
local dir_from_pos = {
    ["0,-"] = defines.direction.north,
    ["0,+"] = defines.direction.south,
    ["-,0"] = defines.direction.west,
    ["+,0"] = defines.direction.east,
}

local function position_key(pos)
    if math.abs(pos[1]) > math.abs(pos[2]) then
        return (pos[1] > 0 and "+" or "-") .. ",0"
    else
        return "0," .. (pos[2] > 0 and "+" or "-")
    end
end

-- Makes directions depending if given input is array (connected connections or singular)
function M.make_connection(position, flow_direction)
    local function make_one(pos)
        return {
            flow_direction = flow_direction or "input-output",
            position = pos,
            direction = dir_from_pos[position_key(pos)]
        }
    end

    -- if it's a table of positions (array of tables)
    if type(position[1]) == "table" then
        local connections = {}
        for _, pos in ipairs(position) do
            table.insert(connections, make_one(pos))
        end
        return connections
    else
        -- single position
        return make_one(position)
    end
end

-- Creates a full fluid box, it's also valid for singular fluid_box creation.
function M.make_pipe(args)
    local connections = M.make_connection(args.position, args.flow_direction)

    -- If it's a single connection, wrap in table
    if connections.direction then
        connections = { connections }
    end
    local pipe = {
        production_type = args.production_type,
        pipe_covers     = args.pipe_covers,
        pipe_pictures   = args.pipe_pictures,
        volume          = args.volume * (args.output_multiplier or 1),
        pipe_connections = connections
    }

    if args.secondary_draw_orders then
        pipe.secondary_draw_orders = args.secondary_draw_orders
    end
    if args.always_draw_covers then
        pipe.always_draw_covers = true
    end
    return pipe
end

-- Creates full array of fluid boxes.
function M.make_pipes(args)
    local new_fbh_boxes = {}

    local function add_pipes(positions, production_type)
        for _, pos in ipairs(positions) do
            table.insert(new_fbh_boxes, M.make_pipe{
                production_type = production_type,
                volume = args.volume,
                output_multiplier = args.output_multiplier,
                position = pos,
                flow_direction = args.flow_direction,
                pipe_pictures = args.pipe_pictures,
                pipe_covers = args.pipecoverspictures,
                secondary_draw_orders = args.secondary_draw_orders,
                always_draw_covers = args.always_draw_covers,
                
            })
        end
    end

    add_pipes(args.pipe_positions_input or {}, "input")
    add_pipes(args.pipe_positions_output or {}, "output")

    return new_fbh_boxes
end
return M
