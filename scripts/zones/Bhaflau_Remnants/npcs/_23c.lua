
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 2nd floor 1st door opens East Wing, locks West Wing
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
        xi.salvageUtil.onDoorOpen(npc, nil, 1)
        xi.salvageUtil.sealDoors(npc, ID.npc[2].WEST_ENTRANCE)
        xi.salvageUtil.unsealDoors(npc, ID.npc[2].SE_ENTRANCE)
        xi.salvageUtil.unsealDoors(npc, ID.npc[2].NE_ENTRANCE)
        xi.salvageUtil.spawnStage(player)

        if math.random(100) >= 50 then
            instance:getEntity(bit.band(ID.npc[2].SOCKET, 0xFFF), xi.objType.NPC):setPos(458,0,260)
            instance:getEntity(bit.band(ID.npc[2].SOCKET, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
        end
    end
end

return entity
