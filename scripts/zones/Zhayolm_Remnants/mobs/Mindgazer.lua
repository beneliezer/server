-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Mindgazer
-----------------------------------
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
        if math.random(1,1000) >= 960 then
            local params = {}
            xi.salvageUtil.spawnTempChest(mob, params)
        end
end

return entity
