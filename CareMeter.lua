

-- /script CareMeter:Care(0)
CareMeter = {}

local INDICATOR = "|"
local LSCALE = "-10"
local RSCALE = "10"

function CareMeter:Care(howMuch) 
    local offset = math.min(20, math.max(howMuch + 11, 1))
    
    print("CareMeter™: " .. LSCALE " ["..string.rep("-", offset-1) .. INDICATOR .. string.rep("-", 21-offset).."] " .. RSCALE)
    
end