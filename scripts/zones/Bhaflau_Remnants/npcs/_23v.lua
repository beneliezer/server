
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 5th Floor 1st door
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
        xi.salvageUtil.unsealDoors(npc, ID.npc[5].DOOR2)
    end
end

return entity
