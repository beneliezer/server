-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Mamool Ja Bounder (THF)
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()
    local stage = instance:getStage()
    local progress = instance:getProgress()

    if stage == 2 and progress == 4 then
        instance:setProgress(5)
        instance:getEntity(bit.band(ID.npc[stage].SOCKET, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
        xi.salvageUtil.unsealDoors(mob, ID.npc[2].DOORS)
        xi.salvageUtil.spawnGroup(player, ID.mob[2][1].STAGE_START.NORTH_EAST)
        xi.salvageUtil.spawnGroup(player, ID.mob[2][2].STAGE_START.SOUTH_EAST)
        xi.salvageUtil.spawnGroup(player, ID.mob[2][3].STAGE_START.SOUTH_WEST)
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

return entity
