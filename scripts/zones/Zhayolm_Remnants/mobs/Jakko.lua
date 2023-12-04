-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Jakko
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()
    local stage = instance:getStage()

    if stage == 2 then
        instance:setLocalVar("killedNMs", instance:getLocalVar("killedNMs") + 1)
    end

    if math.random(1,1000) >= 960 then
        xi.salvageUtil.spawnTempChest(mob)
    end
end

return entity
