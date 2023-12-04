-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Archaic Chariot
-----------------------------------
mixins = {require("scripts/mixins/families/chariot")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()

    if instance:getStage() == 4 then
        instance:setLocalVar("bossModifier", instance:getProgress())
    end

    if math.random(1,1000) >= 960 then
        local params = {}
        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
