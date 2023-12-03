-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Wyvern
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    local instance = mob:getInstance()
    local stage = instance:getStage()

    if firstCall and stage == 2 then
        if xi.salvageUtil.groupKilled(mob, ID.mob[2][3].STAGE_START.SOUTH_WEST) then
            local stageBoss = ID.mob[2][3].MAMOOL_JA
            if instance:getEntity(bit.band(stageBoss, 0xFFF), xi.objType.MOB):getLocalVar("spawned") == 0 then
                SpawnMob(stageBoss, instance)
                instance:getEntity(bit.band(stageBoss, 0xFFF), xi.objType.MOB):setLocalVar("spawned", 1)
            end
        end
		
        if xi.salvageUtil.groupKilled(mob, ID.mob[2][4].STAGE_START.NORTH_WEST) then
            local stageBoss = ID.mob[2][4].MAMOOL_JA
            if instance:getEntity(bit.band(stageBoss, 0xFFF), xi.objType.MOB):getLocalVar("spawned") == 0 then
                SpawnMob(stageBoss, instance)
                instance:getEntity(bit.band(stageBoss, 0xFFF), xi.objType.MOB):setLocalVar("spawned", 1)
            end
        end
		
        if math.random(1,1000) >= 960 then
            local params = {}
            xi.salvageUtil.spawnTempChest(mob, params)
        end
    end
end

return entity
