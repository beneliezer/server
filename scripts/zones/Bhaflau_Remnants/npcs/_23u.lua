
-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- 4th Floor East to Central Area
-- !pos -320 -2 140, 17084919
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local instance = npc:getInstance()
    if instance:getProgress() == 2 then
        player:startEvent(300)
    else
        player:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        xi.salvageUtil.onDoorOpen(npc)
    end
end

return entity
