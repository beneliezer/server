-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Mamool Ja Mimicker
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()
    local stage = instance:getStage()

    if stage == 3 then
        if xi.salvageUtil.groupKilled(mob, ID.mob[3][0].STAGE_START.NORTH_PATH) then
            local mobID = ID.mob[3].POROGGO_MADAME
            local stageBoss = instance:getEntity(bit.band(mobID, 0xFFF), xi.objType.MOB)

            if stageBoss:getLocalVar("spawned") == 0 then
                SpawnMob(mobID, instance):setPos(300, -4, 526)
                stageBoss:setDropID(7324)
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
