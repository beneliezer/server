-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Archaic Gear
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    instance = mob:getInstance()

    if instance:getStage() == 5 and instance:getProgress() == 2 then
        if mob:getID() >= 17076503 and mob:getID() <= 17076510 then
            onMobRoam(mob)
        end
    elseif instance:getStage() == 6 then
        mob:addImmunity(xi.immunity.DARKSLEEP)
        onMobRoam(mob)
    end
end

entity.onPath = function(mob)
    local instance = mob:getInstance()
    local stage = instance:getStage()
    local progress = instance:getProgress()
    local mobID = mob:getID()
    local offset = 0

    if mobID >= 17076503 and mobID <= 17076510 then
        offset = 17076502
    elseif mobID >= 17076571 then
        offset = 17076560
    end

    if offset > 0 then
        local pathID = mob:getID() - offset
        mob:pathThrough(ID.path[stage][progress][pathID], xi.path.flag.PATROL)
    end
end

entity.onMobRoam = function(mob)
    local instance = mob:getInstance()
    local stage = instance:getStage()
    local progress = instance:getProgress()
    local mobID = mob:getID()
    local offset = 0

    if mobID >= 17076503 and mobID <= 17076510 then
        offset = 17076502
    elseif mobID >= 17076571 then
        offset = 17076560
    end

    if offset > 0 then
        local pathID = mobID - offset
        if not mob:isFollowingPath() then
            mob:pathThrough(xi.path.first(ID.path[stage][progress][pathID]))
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
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

return entity
