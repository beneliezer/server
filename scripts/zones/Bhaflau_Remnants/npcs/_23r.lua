
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 3rd Floor South Central Entry
-- !pos -340 0 -440, 17084916
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
        local instance = player:getInstance()
        xi.salvageUtil.onDoorOpen(npc)
        xi.salvageUtil.unsealDoors(npc, ID.npc[3].EAST_EXIT)
        xi.salvageUtil.unsealDoors(npc, ID.npc[3].WEST_EXIT)
        xi.salvageUtil.spawnGroup(npc, ID.mob[3][7])
        instance:getEntity(bit.band(ID.npc[3].SLOT, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
    end
end

return entity
