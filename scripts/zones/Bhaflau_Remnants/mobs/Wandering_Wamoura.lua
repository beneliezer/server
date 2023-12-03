-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Wandering Wamoura
-----------------------------------
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller, firstCall)
	if firstCall then
        if math.random(1,1000) >= 960 then
            local params = {}
			
            xi.salvageUtil.spawnTempChest(mob, params)
        end
    end
end

return entity
