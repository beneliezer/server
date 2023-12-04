-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Mamool Ja Zenist
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    -- mob:addImmunity(xi.immunity.SILENCE)
end

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()
    local stage = instance:getStage()
    local progress = instance:getProgress()

    if stage == 1 then
        local params = {}
        params.itemID_1 = xi.items.DUSTY_POTION
        params.itemAmount_1 = 18

        xi.salvageUtil.spawnTempChest(mob, params)
        mob:setDropID(0)
    elseif stage == 2 and progress == 2 then
        instance:setProgress(5)
        instance:getEntity(bit.band(ID.npc[stage].SLOT, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
        instance:getEntity(bit.band(ID.npc[stage].SOCKET, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
        xi.salvageUtil.unsealDoors(mob, ID.npc[2].DOORS)
        xi.salvageUtil.spawnGroup(player, ID.mob[2][1].STAGE_START.NORTH_EAST)
        xi.salvageUtil.spawnGroup(player, ID.mob[2][3].STAGE_START.SOUTH_WEST)
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

return entity
