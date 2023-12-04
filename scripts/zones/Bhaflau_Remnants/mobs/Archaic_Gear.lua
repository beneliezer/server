-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Archaic Gear
--
-----------------------------------
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()

    if instance:getStage() == 4 then
        mob:addListener("TAKE_DAMAGE", "GEAR_TAKE_DAMAGE", function(mob, damage, attacker, attackType, damageType)
            if attackType ~= xi.attackType.RANGED then
                mob:playAnimation(122, 0)
                mob:timer(4000, function(mob) DespawnMob(mob:getID(), instance) end)
            end
        end)
    end
end

entity.onMobEngaged = function(mob, target)
    local instance = mob:getInstance()

    if instance:getStage() == 4 then
        local CE = 0
        local VE = 0
        CE = mob:getCE(target)
        VE = mob:getVE(target)

        if (CE == 0 and VE == 0) then --or mob:getHP() < mob:getMaxHP() then
            mob:playAnimation(122, 0)
            mob:timer(4000, function(mob) DespawnMob(mob:getID(), instance) end)
        end
        mob:removeListener("GEAR_TAKE_DAMAGE")
    end
end

entity.onMobFight = function(mob, target)
    local instance = mob:getInstance()

    if instance:getStage() == 4 then
        if mob:getBattleTime() > 60 and mob:getLocalVar("teleport") == 0 then
            mob:setLocalVar("teleport", 1)
            mob:playAnimation(122, 0)
            mob:timer(4000, function(mob) DespawnMob(mob:getID(), instance) end)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()

    if instance:getStage() == 4 then
        instance:setLocalVar("gearsKilled", instance:getLocalVar("gearsKilled") + 1)
        if instance:getLocalVar("gearsKilled") >= 10 then
            instance:getEntity(bit.band(ID.npc[4].DORMANT, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
        end
    end
	
    if math.random(1,1000) >= 960 then
        local params = {}
        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
