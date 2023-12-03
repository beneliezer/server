-----------------------------------
-- Door
-- Floor 1 Begining Door
-- !pos 400 -2 -560
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(300)
end

entity.onEventFinish = function(player, csid, option, npc)
    local instance = npc:getInstance()

    if csid == 300 and option == 1 then
        instance:setLocalVar("allySize", player:getPartySize(0))
        xi.salvageUtil.onDoorOpen(npc, nil, 1)
        xi.salvageUtil.unsealDoors(npc, ID.npc[1].DOORS)
        xi.salvageUtil.spawnStage(player)
    end
end

return entity
