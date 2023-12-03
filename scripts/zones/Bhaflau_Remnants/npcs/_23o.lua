
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 3rd Floor NE Door
-- !pos -280 0 -260, 17084913
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getInstance():getProgress() == 3 then
        player:startEvent(300)
    else
        player:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        xi.salvageUtil.onDoorOpen(npc, nil, 5)
        xi.salvageUtil.unsealDoors(npc, ID.npc[3].NORTH_CENTRAL)
        xi.salvageUtil.spawnGroup(npc, ID.mob[3][5])
    end
end

return entity
