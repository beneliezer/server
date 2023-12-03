-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Fourth Rampart
-----------------------------------
mixins =
{
    require("scripts/mixins/families/rampart")
}
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()
	
    mob:setMobMod(xi.mobMod.NO_AGGRO, 1)
    mob:setMobMod(xi.mobMod.NO_ROAM, 1)
    mob:setPet(instance:getEntity(bit.band(mob:getID() + 4, 0xFFF), xi.objType.MOB))
end

entity.onMobEngaged = function(mob, target)
    local instance = mob:getInstance()
    local mobID = mob:getID()

    DespawnMob(mobID - 1, instance)
    DespawnMob(mobID - 2, instance)
    DespawnMob(mobID - 3, instance)
end

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if firstCall then
        local instance = mob:getInstance()
        local enteringDay = instance:getLocalVar("dayElement") - 1

        xi.salvageUtil.unsealDoors(mob, ID.npc[4][instance:getProgress()].DOOR)

        if enteringDay == xi.day.LIGHTSDAY or enteringDay == xi.day.DARKSDAY then
            instance:setLocalVar("repeatFloor", 0)
        end
    end
end

return entity
