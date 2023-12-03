-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Mamool Ja Strapper (BST)
-- 17076349, 17076350, 17076351, 17076352, +4
-- 17076360, 17076366, 17076372 +2
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local mobID = mob:getID()
    local instance = mob:getInstance()

    if mobID >= 17076360 then
        mob:setPet(instance:getEntity(bit.band(mobID + 2, 0xFFF), xi.objType.MOB))
    else
        mob:setPet(instance:getEntity(bit.band(mobID + 4, 0xFFF), xi.objType.MOB))
    end
end

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if firstCall then
        local instance = mob:getInstance()
        local stage = instance:getStage()

        if stage == 3 then
            if xi.salvageUtil.groupKilled(mob, ID.mob[3][0].STAGE_START.SOUTH_PATH) then
                local mobID = ID.mob[3].POROGGO_MADAME
                local stageBoss = instance:getEntity(bit.band(mobID, 0xFFF), xi.objType.MOB)
                if stageBoss:getLocalVar("spawned") == 0 then
                    SpawnMob(mobID, instance):setPos(380, -4, 389)
                    stageBoss:setDropID(7325)
                    stageBoss:setLocalVar("spawned", 1)
                end
            end
        end
		
        if math.random(1,1000) >= 960 then
            local params = {}
			
            xi.salvageUtil.spawnTempChest(mob, params)
        end
    end
end

return entity
