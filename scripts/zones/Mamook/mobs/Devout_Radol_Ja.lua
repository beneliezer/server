-----------------------------------
-- Area: Mamook
--   NM: Devout Radol Ja
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(259200, 432000)) -- 3 to 5 days
end

return entity
