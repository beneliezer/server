-----------------------------------
-- Area: Bhaflau Remnants
-- NPC: Armoury Crate (Bhaflau)
-----------------------------------
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    xi.salvageUtil.onTriggerCrate(player, npc)
end

return entity
