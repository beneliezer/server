-----------------------------------
-- func: build
-- desc: Print the server's current build information
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ""
}

commandObj.onTrigger = function(player, target)
    player:printToPlayer(BuildString())
end

return commandObj
