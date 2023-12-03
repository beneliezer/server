-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Archaic Chariot
-- HP 30500
-----------------------------------
mixins = {require("scripts/mixins/families/chariot")}
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    if mob:getID() == ID.mob[6][1].STAGE_START.CHARIOT then
        mob:setMobMod(xi.mobMod.SUBLINK, 0)
        mob:setMobMod(xi.mobMod.NO_AGGRO, 1)
    else
        mob:setMobMod(xi.mobMod.NO_ROAM, 1)
    end
end

entity.onMobEngaged = function(mob, target)
    local instance = mob:getInstance()
    local stage = instance:getStage()

    if stage == 6 then
        xi.salvageUtil.spawnGroup(mob, ID.mob[6][1].CHARIOT_GEARS)
    end
end

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if firstCall then
        local instance = mob:getInstance()
        local stage = instance:getStage()
        local progress = instance:getProgress()

        if stage == 6 then
            instance:setLocalVar("6th Door",instance:getLocalVar("6th Door") + 1)
        end
        if math.random(1,1000) >= 960 then
            local params = {}
			
            xi.salvageUtil.spawnTempChest(mob, params)
        end
    end
end

return entity
