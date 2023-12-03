-----------------------------------
-- Area: Zhayolm Remnants
-- NPC: Armoury Crate (Zhayolm) Temp Items
-----------------------------------
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    xi.salvageUtil.tempBoxTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.salvageUtil.tempBoxFinish(player, csid, option, npc)
end

return entity
