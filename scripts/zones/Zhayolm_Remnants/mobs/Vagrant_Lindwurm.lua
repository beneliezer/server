-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Vagrant Lindwurm
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if xi.salvageUtil.groupKilled(mob, ID.mob[1][1].STAGE_START.LINDWURM) then
        local instance = mob:getInstance()
        SpawnMob(ID.mob[1].POROGGO_GENT_LINDWURM, instance):setDropID(7304)
    end

    if math.random(1,1000) >= 960 then
        local params = {}

        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
