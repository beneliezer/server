-----------------------------------
-- Gargouille family mixin
-----------------------------------
require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------
g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

-- This mobs switches between standing and flying at regular intervals (every 3-4 mins)
-- Mob uses Bloody Claw in either stage, and some Gargouille NMs can also use Shadow Burst
-- While standing, they use Terror Eye and Triumphant Roar
-- While flying, they use Dark Mist and Dark Orb, and they receive Evasion +60 and Magic Dmg Taken -12.5%.

local function flyRoaming(mob)
    mob:setAnimationSub(5) -- Fly
    mob:setLocalVar("formTimeRoam", os.time() + math.random(180, 240))
    mob:setMobMod(xi.mobMod.SKILL_LIST, 117) -- Set Fly Skill List. ("Dark Mist" and "Dark Orb")
    mob:addMod(xi.mod.EVA, 6000)
    mob:addMod(xi.mod.DMGMAGIC, -1250)
end

local function standRoaming(mob)
    mob:setAnimationSub(4) -- Stand
    mob:setLocalVar("formTimeRoam", os.time() + math.random(180, 240))
    mob:setMobMod(xi.mobMod.SKILL_LIST, 118) -- Set Standing Skill List. ("Terror Eye" and "Triumphant Roar")
    mob:delMod(xi.mod.EVA, 6000)
    mob:delMod(xi.mod.DMGMAGIC, -1250)
end

local function flyEngaged(mob)
    mob:setAnimationSub(5) -- Fly
    mob:setMobMod(xi.mobMod.SKILL_LIST, 117) -- Set Fly Skill List. ("Dark Mist" and "Dark Orb")
    mob:addMod(xi.mod.EVA, 6000)
    mob:addMod(xi.mod.DMGMAGIC, -1250)
end

local function standEngaged(mob)
    mob:setAnimationSub(4) -- Stand
    mob:setMobMod(xi.mobMod.SKILL_LIST, 118) -- Set Standing Skill List. ("Terror Eye" and "Triumphant Roar")
    mob:delMod(xi.mod.EVA, 6000)
    mob:delMod(xi.mod.DMGMAGIC, -1250)
end

local function resetCount(mob)
    mob:setLocalVar("formTimeEngaged", os.time() + math.random(45, 60))
end

g_mixins.families.gargouille = function(gargouilleMob)
    -- Set spawn.
    gargouilleMob:addListener("SPAWN", "GARGOUILLE_SPAWN", function(mob)
        mob:setAnimationSub(4)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 118) -- Set Standing Skill List. ("Terror Eye" and "Triumphant Roar")
        mob:setLocalVar("formTimeRoam", os.time() + math.random(180, 240))
        mob:setLocalVar("formTimeEngaged", os.time())
    end)

    -- Handle regular changes on roam.
    gargouilleMob:addListener("ROAM_TICK", "GARGOUILLE_ROAM", function(mob)
        if os.time() - mob:getLocalVar("formTimeRoam") > 0 then
            if mob:getAnimationSub() == 4 then
                flyRoaming(mob)
            elseif mob:getAnimationSub() == 5 then
                standRoaming(mob)
            end
        end
    end)

    -- Makes mob fly if not already upon engaging.
    gargouilleMob:addListener("ENGAGE", "GARGOUILLE_ENGAGE", function(mob)
        if mob:getAnimationSub() == 4 then
            flyEngaged(mob)
        end

        resetCount(mob)
    end)

    -- Handle swapping stances in combat
    gargouilleMob:addListener("COMBAT_TICK", "GARGOUILLE_COMBAT", function(mob)
        if os.time() - mob:getLocalVar("formTimeEngaged") > 0 then
            if mob:getAnimationSub() == 4 then
                flyEngaged(mob)
            elseif mob:getAnimationSub() == 5 then
                standEngaged(mob)
            end

            resetCount(mob)
        end
    end)
end

return g_mixins.families.gargouille
