-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Greater Manticore
-----------------------------------
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local params = {}

    xi.salvageUtil.spawnTempChest(mob, params)
end

return entity
