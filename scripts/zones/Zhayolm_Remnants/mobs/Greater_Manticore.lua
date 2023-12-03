-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Greater Manticore
-----------------------------------
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if firstCall then
        local params = {}
		
        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
