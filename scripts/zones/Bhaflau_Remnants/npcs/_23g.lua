
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 2nd floor 2nd door East Wing, opens SE section, locks NE Section
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if npc:getLocalVar("unSealed") == 1 then
        player:startEvent(300)
    else
        player:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        xi.salvageUtil.onDoorOpen(npc)
        xi.salvageUtil.sealDoors(npc, ID.npc[2].NE_ENTRANCE)
        xi.salvageUtil.unsealDoors(npc, ID.npc[2].SE_EXIT)
        xi.salvageUtil.spawnGroup(npc, ID.mob[2][1].SOUTH_EAST)
    end
end

return entity
