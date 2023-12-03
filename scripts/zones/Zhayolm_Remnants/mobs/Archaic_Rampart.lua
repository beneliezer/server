-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Archaic Rampart
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

    mob:setMobMod(xi.mobMod.NO_ROAM, 1)
	
    if (mob:getID() >= 17076529 and mob:getID() <= 17076531) or (mob:getID() >= 17076496 and mob:getID() <= 17076498) then
        mob:setPet(instance:getEntity(bit.band(mob:getID() + 3, 0xFFF), xi.objType.MOB))
    else
        mob:setPet(instance:getEntity(bit.band(mob:getID() + 1, 0xFFF), xi.objType.MOB))
    end
end

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if firstCall then
        local instance = mob:getInstance()
        local stage = instance:getStage()

        if stage == 3 then
            local mobID = ID.mob[3].POROGGO_MADAME
            local stageBoss = instance:getEntity(bit.band(mobID, 0xFFF), xi.objType.MOB)
            if xi.salvageUtil.groupKilled(mob, ID.mob[3][0].STAGE_START.SOUTH_PATH) then
                if stageBoss:getLocalVar("spawned") == 0 then
                    SpawnMob(mobID, instance):setPos(380, -4, 389)
                    stageBoss:setDropID(7325)
                    stageBoss:setLocalVar("spawned", 1)
                end
            elseif xi.salvageUtil.groupKilled(mob, ID.mob[3][0].STAGE_START.NORTH_PATH) then
                if stageBoss:getLocalVar("spawned") == 0 then
                    SpawnMob(mobID, instance):setPos(300, -4, 526)
                    stageBoss:setDropID(7324)
                    stageBoss:setLocalVar("spawned", 1)
                end
            end
        end
		
        if instance:getStage() == 5 and not mob:getID() == 17076515 and not mob:getID() == 17076556 then
            local params = {}
			
            xi.salvageUtil.spawnTempChest(mob, params)
        elseif math.random(1,1000) >= 960 then
            local params = {}
			
            xi.salvageUtil.spawnTempChest(mob, params)
        end
    end
end

return entity
