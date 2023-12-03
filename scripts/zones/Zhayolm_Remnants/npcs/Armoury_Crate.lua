-----------------------------------
-- Area: Zhayolm Remnants
-- NPC: Armoury Crate (Zhayolm)
-----------------------------------
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    xi.salvageUtil.onTriggerCrate(player, npc)
end

return entity
