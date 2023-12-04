-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Puk
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if xi.salvageUtil.groupKilled(mob, ID.mob[1][1].STAGE_START.PUK) then
        local instance = mob:getInstance()

        SpawnMob(ID.mob[1].POROGGO_GENT_PUK, instance):setDropID(7303)
    end

    if math.random(1,1000) >= 960 then
        local params = {}

        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
