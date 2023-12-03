
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 5th Floor Door to Boss
-- !pos -340 -4 400
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
        npc:timer(3000, function(npc)
            local instance = npc:getInstance()
            instance:getEntity(bit.band(npc:getID() -1, 0xFFF), xi.objType.NPC):setAnimation(8)
        end)
    end
end

return entity
