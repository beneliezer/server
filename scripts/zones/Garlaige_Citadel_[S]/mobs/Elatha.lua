----------------------------------
-- Area: Garlaige Citadel [S]
--   NM: Elatha
----------------------------------
mixins =
{
    require('scripts/mixins/fomor_hate'),
    require('scripts/mixins/job_special'),
    require('scripts/mixins/rage')
}
require('scripts/globals/magic')
require('scripts/globals/hunts')
require('scripts/globals/utils')
require('scripts/globals/job_utils/geomancer')
----------------------------------
local entity = {}

local message = 232

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.GIL_MIN, 12000)
    mob:setMobMod(xi.mobMod.GIL_MAX, 30000)
    mob:setMobMod(xi.mobMod.MUG_GIL, 8000)
end

entity.onMobSpawn = function(mob)
    -- All Mods Here Are Assigned For Initial Difficulty Tuning
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
    mob:addMod(xi.mod.STR, 40)
    mob:addMod(xi.mod.VIT, 20)
    mob:addMod(xi.mod.INT, 65)
    mob:addMod(xi.mod.MND, 20)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 20)
    mob:addMod(xi.mod.DEX, 40)
    mob:setMod(xi.mod.DEFP, 0)
    mob:setMod(xi.mod.RATTP, 0)
    mob:setMod(xi.mod.FASTCAST, 10)
    -- Status Effecs Based On https://ffxiclopedia.fandom.com/wiki/Elatha
    mob:addStatusEffect(xi.effect.ICE_SPIKES, 10, 0, 0)
    mob:addStatusEffect(xi.effect.REGEN, 10, 1, 0)
    -- Increasing Enblizzard for Standard Attack Round to 100 (http://wiki.ffo.jp/wiki.cgi?Command=HDetail&articleid=129694&id=18305)
    mob:addStatusEffect(xi.effect.ENBLIZZARD_II, 15, 0, 0)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- 25% En-Paralyze
    if not target:hasStatusEffect(xi.effect.PARALYSIS) then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE, { chance = 25 })
    end
end

entity.onMobFight = function(mob, target)
   -- Blood Weapon
    -- Should Be Used Every 5 Minutes, Set to 50% Health As Baseline (https://ffxiclopedia.fandom.com/wiki/Elatha)
    local timer = mob:getLocalVar('EBloodWeaponTimer')
    if mob:getHPP() <= 50 then
        if os.time() > timer then
            mob:useMobAbility(695)
            mob:setLocalVar('EBloodWeaponTimer', os.time() + 300)
            mob:setLocalVar('EBloodWeaponFollow', 1)
            mob:setAnimationSub(1)
        end
    end

    -- 20 Yalm Paralyze Aura Wtih Blood Weapon Active (https://ffxiclopedia.fandom.com/wiki/Elatha)
    -- This just silently removes and adds Paralyze. RIP Battlemod users' HUDs for the next 60 seconds.
    if mob:hasStatusEffect(xi.effect.BLOOD_WEAPON) then
        local nearbyPlayers = xi.auraTarget.PLAYER

        if nearbyPlayers == nil then
            return
        end

        for _, v in ipairs(nearbyPlayers) do
            v:delStatusEffectSilent(xi.effect.PARALYSIS)
            v:addStatusEffectEx(xi.effect.PARALYSIS, xi.effect.PARALYSIS, 25, 0, 5)
        end
    end

    -- Combat Tick Logic
    mob:addListener('COMBAT_TICK', 'ELATHA_CTICK', function(mobArg)
        local retaliate = mob:getLocalVar('ERetaliate')
        local efollowup = mob:getLocalVar('EBloodWeaponFollow')

        if mobArg:getAnimationSub() == 1 then
            -- Retaliation Should Cause Level Up And Always Be Blizzard IV With Instant Cast (https://ffxiclopedia.fandom.com/wiki/Elatha)
            if retaliate > 0 then
                -- Perform Retalitory Blizzard IV
                mobArg:setMod(xi.mod.UFASTCAST, 100)
                mobArg:castSpell(152)
                -- Perform Level Up
                local levelupsum = mob:getLocalVar('TotalLevelUp')
                if levelupsum <= 15 then
                    mobArg:useMobAbility(2460)
                    mobArg:setLocalVar('TotalLevelUp', levelupsum + 1)
                end

                mobArg:setLocalVar('ERetaliate', 0)
                mobArg:setAnimationSub(0)
            -- Uses Shockwave Right After Bloodweapon (https://ffxiclopedia.fandom.com/wiki/Elatha)
            elseif efollowup > 0 then
                -- Use Shockwave
                mobArg:setAnimationSub(0)
                mobArg:addTP(3000)
                mobArg:useMobAbility(52)
                mobArg:setLocalVar('EBloodWeaponFollow', 0)
            -- Resets States And Mods
            else
                mobArg:setLocalVar('ERetaliate', 0)
                mobArg:setLocalVar('EBloodWeaponFollow', 0)
                mobArg:setMod(xi.mod.UFASTCAST, 0)
                mobArg:setAnimationSub(0)
            end
        else
            if mobArg:getCurrentAction() ~= 30 then
                mob:setMod(xi.mod.UFASTCAST, 0)
            end
        end
    end)

    -- Magic Retaliation and Level Up Function
    -- Should Always Retaliate When Taking Magic Damage and Level Up (https://ffxiclopedia.fandom.com/wiki/Elatha)
    mob:addListener('MAGIC_TAKE', 'ELATHA_MAGIC_TAKE', function(targetArg, caster, spell)
        if
            targetArg:getAnimationSub() == 0 and
            spell:tookEffect() and
            (caster:isPC() or caster:isPet())
        then
            targetArg:setLocalVar('ERetaliate', 1)
            targetArg:addEnmity(caster, 1000, 1000)
            targetArg:setAnimationSub(1)
        end
    end)

    -- Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Elatha)
    mob:addListener('TAKE_DAMAGE', 'ELATHA_TAKE_DAMAGE', function(mobArg, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.PHYSICAL then
            mobArg:addEnmity(attacker, 1000, 1000)
        end
    end)

    mob:addListener('WEAPONSKILL_TAKE', 'ELATHA_WEAPONSKILL_TAKE', function(targetArg, attacker, skillid, tp, action)
        targetArg:addEnmity(attacker, 1000, 1000)
    end)
end


entity.onMobDrawIn = function(mob, target)
    -- Arena Style Draw-In
    -- Should Draw Into A Single Point In the Room, Draws In Anyone In Range (https://ffxiclopedia.fandom.com/wiki/Elatha)
    local drawInWait = mob:getLocalVar('DrawInWait')

    if
        (target:getZPos() < -111.00 or target:getZPos() > -82.00) and
        os.time() > drawInWait
    then
        target:setPos(-140.25, 0.00, -100.00)
        mob:messageBasic(message, 0, 0, target)
        mob:setLocalVar('DrawInWait', os.time() + 2)
    elseif
        (target:getXPos() < -155.00 or target:getXPos() > -122.00) and
        os.time() > drawInWait
    then
        target:setPos(-140.25, 0.00, -100.00)
        mob:messageBasic(message, 0, 0, target)
        mob:setLocalVar('DrawInWait', os.time() + 2)
    end
end

entity.onMobDisengage = function(mob)
    local levelupsum = mob:getLocalVar('TotalLevelUp')

    if mob:getHPP() < 100 or levelupsum > 0 then
        DespawnMob(17449008)
        mob:setLocalVar('TotalLevelUp', 0)
        mob:setLocalVar('EFightTimer', 0)
        mob:setLocalVar('MobPoof', 1)
    end

    mob:removeListener('ELATHA_WEAPONSKILL_TAKE')
    mob:removeListener('ELATHA_DAMAGE')
    mob:removeListener('ELATHA_TAKE')
end

entity.onMobDespawn = function(mob)
    if mob:getLocalVar('MobPoof') == 1 then
        mob:showText(mob, zones[mob:getZoneID()].text.NM_DESPAWN)
        mob:setLocalVar('MobPoof', 0)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 534)
end

return entity
