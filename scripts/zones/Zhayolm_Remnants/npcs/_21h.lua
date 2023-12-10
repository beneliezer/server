local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(300)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        local instance = npc:getInstance()
        -- instance:getEntity(bit.band(npc:getID() + 1, 0xFFF), xi.objType.NPC):setStatus(xi.status.DISAPPEAR)
        xi.salvageUtil.onDoorOpen(npc)
    end
end

return entity
