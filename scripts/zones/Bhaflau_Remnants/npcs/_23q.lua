
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 3rd Floor SE door
-- !pos -280 0 -500, 17084915
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getInstance():getProgress() == 4 then
        player:startEvent(300)
    else
        player:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        xi.salvageUtil.onDoorOpen(npc, nil, 6)
        xi.salvageUtil.unsealDoors(npc, ID.npc[3].SOUTH_CENTRAL)
        xi.salvageUtil.spawnGroup(npc, ID.mob[3][6])
    end
end

return entity
