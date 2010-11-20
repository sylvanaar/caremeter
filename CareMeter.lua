

-- /script CareMeter:Care(0)
-- [15:18:21] CareMeter™: -10 [----------|----------] 10
CareMeter = {}

local INDICATOR = "|"
local LSCALE = "-10"
local RSCALE = "10"

function CareMeter:Care(howMuch) 
    local offset = math.min(21, math.max(howMuch + 11, 1))
    
    return "CareMeter™: " .. LSCALE .. " ["..string.rep("-", offset-1) .. INDICATOR .. string.rep("-", 21-offset).."] " .. RSCALE    
end

function CareMeter.SlashHandler(msg)
    local msg1, msg2, msg3 = strsplit(" ", msg)


    local howmuch = tonumber(msg1)
    local channel = msg2
    local extra = msg3
    
    local meter 
        
    if howmuch then
        meter = CareMeter:Care(howmuch)
        
        if channel then
            SendChatMessage(meter:gsub("|", "||"), channel:upper(), GetDefaultLanguage("player"), extra)
        else
            print(meter)
        end
    else
        print("Usage:  /care <howmuch> [channel] [channeldata].  Examples: /care 0 channel 5, /care 10 guild, /care -10 whisper somename")
    end
    
    
end


SlashCmdList["CAREMETER"] = CareMeter.SlashHandler

SLASH_CAREMETER1 = "/care"