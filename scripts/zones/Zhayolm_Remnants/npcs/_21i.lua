-----------------------------------
-- Door
-- Floor 1 South East to Portal
-- !pos 380 -22 -520
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(300)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        local instance = npc:getInstance()

        instance:getEntity(bit.band(npc:getID() - 1, 0xFFF), xi.objType.NPC):setStatus(xi.status.DISAPPEAR)
        instance:getEntity(bit.band(npc:getID(), 0xFFF), xi.objType.NPC):setStatus(xi.status.DISAPPEAR)
        instance:getEntity(bit.band(npc:getID() - 1, 0xFFF), xi.objType.NPC):setAnimation(8)
        instance:getEntity(bit.band(npc:getID(), 0xFFF), xi.objType.NPC):setAnimation(8)
    end
end

return entity
