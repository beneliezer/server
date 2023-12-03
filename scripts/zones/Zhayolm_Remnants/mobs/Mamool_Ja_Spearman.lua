-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Mamool Ja Spearman (DRG)
-- 17076341 to 17076347 +1 for pet
-- 17076358, 17076364, 17076370 + 3
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local mobID = mob:getID()
    local instance = mob:getInstance()

    if mobID >= 17076358 then
        mob:setPet(instance:getEntity(bit.band(mobID + 3, 0xFFF), xi.objType.MOB))
    else
        mob:setPet(instance:getEntity(bit.band(mobID + 1, 0xFFF), xi.objType.MOB))
    end
end

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if firstCall then
        local instance = mob:getInstance()
        local stage = instance:getStage()
        local progress = instance:getProgress()

        if stage == 2 and progress == 3 then
            instance:setProgress(5)
            instance:getEntity(bit.band(ID.npc[stage].SLOT, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
            instance:getEntity(bit.band(ID.npc[stage].SOCKET, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
            xi.salvageUtil.unsealDoors(mob, ID.npc[2].DOORS)
            xi.salvageUtil.spawnGroup(player, ID.mob[2][1].STAGE_START.NORTH_EAST)
            xi.salvageUtil.spawnGroup(player, ID.mob[2][2].STAGE_START.SOUTH_EAST)
            xi.salvageUtil.spawnGroup(player, ID.mob[2][4].STAGE_START.NORTH_WEST)
        elseif stage == 3 then
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
