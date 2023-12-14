-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Empathic Flan
-- Defeating all four in AnimationSub(2) will spawn Dormant Rampart
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setAnimationSub(1)

    if mob:getID() == ID.mob[2][0].STAGE_START.MAGICAL then
        mob:setMod(xi.mod.DMGMAGIC, -25)
        mob:addMod(xi.mod.DMGPHYS, 0)
        mob:addMod(xi.mod.DMGRANGE, 0)
    else
        mob:setMod(xi.mod.DMGPHYS, -25)
        mob:setMod(xi.mod.DMGRANGE, -25)
        mob:setMod(xi.mod.DMGMAGIC, 0)
    end

    mob:addListener("TAKE_DAMAGE", "FLAN_TAKE_DAMAGE", function(mob, damage, attacker, attackType, damageType)
        if (attackType == xi.attackType.PHYSICAL or attackType == xi.attackType.RANGED) and mob:getLocalVar("exitMode") == 0 then
            accumulated = mob:getLocalVar("physical")
            accumulated = accumulated + damage
            if accumulated > mob:getMaxHP() * 0.1 or damage > mob:getMaxHP() * 0.1 then
                mob:setAnimationSub(2) -- Spike head
                mob:addMod(xi.mod.DMGPHYS, -50)
                mob:addMod(xi.mod.DMGRANGE, -50)
                mob:addMod(xi.mod.DMGMAGIC, 50)
                mob:setLocalVar("Damage", 1)
                accumulated = 0
            end
			
            mob:setLocalVar("physical", accumulated)
        elseif (attackType == xi.attackType.PHYSICAL or attackType == xi.attackType.RANGED) and mob:getLocalVar("exitMode") == 1 then
            accumulated = mob:getLocalVar("physical")
            accumulated = accumulated + damage
            if accumulated > mob:getMaxHP() * 0.5 or damage > mob:getMaxHP() * 0.2 then
                mob:setAnimationSub(2) -- Spike head
                mob:addMod(xi.mod.DMGPHYS, -50)
                mob:addMod(xi.mod.DMGRANGE, -50)
                mob:addMod(xi.mod.DMGMAGIC, 50)
                mob:setLocalVar("Damage", 1)
                accumulated = 0
            end
			
            mob:setLocalVar("physical", accumulated)
        else
            accumulated = mob:getLocalVar("magical")
            accumulated = accumulated + damage
            if accumulated > mob:getMaxHP() * 0.1 or damage > mob:getMaxHP() * 0.1 then
                mob:setAnimationSub(1) -- Smooth head
                mob:addMod(xi.mod.DMGPHYS, 50)
                mob:addMod(xi.mod.DMGRANGE, 50)
                mob:addMod(xi.mod.DMGMAGIC, -50)
                mob:setLocalVar("Damage", 0)
                mob:setLocalVar("exitMode", 1)
                accumulated = 0
            end
			
            mob:setLocalVar("magical", accumulated)
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()
    local dormant = instance:getEntity(bit.band(ID.npc[2].DORMANT, 0xFFF), xi.objType.NPC)
    local spawn = dormant:getLocalVar("spawn")

    if mob:getLocalVar("Damage") == 1 then
        dormant:setLocalVar("spawn", spawn + 1)
        if dormant:getLocalVar("spawn") == 4 then
            dormant:setStatus(xi.status.NORMAL)
            dormant:setUntargetable(false)
        end
    end

    if math.random(1,1000) >= 960 then
        local params = {}
        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
