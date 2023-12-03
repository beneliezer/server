-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 1st Floor 1st door
-- !pos 340 14 -520
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(300)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        xi.salvageUtil.onDoorOpen(npc)
        xi.salvageUtil.unsealDoors(npc, ID.npc[1].EAST_ENTRANCE)
        xi.salvageUtil.unsealDoors(npc, ID.npc[1].WEST_ENTRANCE)
    end
end

return entity
