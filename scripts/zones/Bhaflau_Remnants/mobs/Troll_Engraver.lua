-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Troll Engraver
-----------------------------------
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()
    local pet = instance:getEntity(bit.band(mob:getID() + 1, 0xFFF), xi.objType.MOB)
	
    mob:setPet(pet)
    SpawnMob(mob:getID() + 1, instance)
end


entity.onMobDeath = function(mob, player, optParams)
    if math.random(1,1000) >= 960 then
        local params = {}

        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
