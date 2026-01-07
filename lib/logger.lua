local MOD_NAME = "Manual APPTH"

local logger = {}

logger.info = function(msg) 
    log("[" .. MOD_NAME .. "] " .. msg) 
end

logger.error = function(msg) 
    log("[" .. MOD_NAME .. "] ERROR: " .. msg) 
end

logger.warn = function(msg) 
    log("[" .. MOD_NAME .. "] WARNING: " .. msg) 
end

logger.debug = function(msg) 
    log("[" .. MOD_NAME .. "] DEBUG: " .. msg) 
end

return logger