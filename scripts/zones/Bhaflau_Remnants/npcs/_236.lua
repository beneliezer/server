-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 1st floor East exit door
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
        xi.salvageUtil.onDoorOpen(npc, nil, 3)
        xi.salvageUtil.unsealDoors(npc, ID.npc[1].CENTER_ENTRANCE)
        xi.salvageUtil.spawnStage(player)
    end
end

return entity
