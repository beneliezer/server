----------------------------------
-- Area: Garlaige Citadel [S]
--   NM: Buarainech
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
----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.GIL_MIN, 12000)
    mob:setMobMod(xi.mobMod.GIL_MAX, 30000)
    mob:setMobMod(xi.mobMod.MUG_GIL, 8000)
end

entity.onMobSpawn = function(mob)
mob:setMod(xi.mod.UDMGBREATH, -10000) -- immune to breath damage
    -- All Mods Here Are Assigned For Initial Difficulty Tuning
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
    mob:addMod(xi.mod.STR, 40)
    mob:addMod(xi.mod.VIT, 20)
    mob:addMod(xi.mod.INT, 50)
    mob:addMod(xi.mod.MND, 20)
    mob:addMod(xi.mod.CHR, 20)
    mob:addMod(xi.mod.AGI, 20)
    mob:addMod(xi.mod.DEX, 40)
    mob:setMod(xi.mod.DEFP, 0)
    mob:setMod(xi.mod.RATTP, 0)
    -- Status Effecs Based On https://ffxiclopedia.fandom.com/wiki/Buarainech
    mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 20, 0, 0)
    mob:addStatusEffect(xi.effect.REGEN, 30, 1, 0)
    -- Increasing Enthunder for Standard Attack Round to 100 (http://wiki.ffo.jp/wiki.cgi?Command=HDetail&articleid=129693&id=18304)
    mob:addStatusEffect(xi.effect.ENTHUNDER_II, 20, 0, 0)
end

entity.onAdditionalEffect = function(mob, target, damage)
    -- 100% En-Doom Kek
    if not target:hasStatusEffect(xi.effect.DOOM) then
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.DOOM, { chance = 100 })
    end
end

entity.onMobFight = function(mob, target)
    -- Combat Tick Logic
    mob:addListener('COMBAT_TICK', 'BUARAINECH_CTICK', function(mobArg)
        local retaliate = mob:getLocalVar('BRetaliate')
        local levelup = mob:getLocalVar('LevelUp')

        if mobArg:getAnimationSub() == 1 then
            -- Retaliation Should Always Be Thunder IV And Instant Cast (https://ffxiclopedia.fandom.com/wiki/Buarainech)
            if
                retaliate > 0 and
                not mob:hasStatusEffect(xi.effect.SILENCE)
            then
                mobArg:setMod(xi.mod.UFASTCAST, 100)
                mobArg:castSpell(167)
                mobArg:setLocalVar('BRetaliate', 0)
                mobArg:setAnimationSub(0)
            -- Uses Level Up Ability
            elseif levelup > 0 then
                mobArg:useMobAbility(2460)
                mobArg:setLocalVar('LevelUp', 0)
                mobArg:setAnimationSub(0)
            -- Resets States And Mods
            else
                mobArg:setLocalVar('BRetaliate', 0)
                mobArg:setLocalVar('LevelUp', 0)
                mobArg:setMod(xi.mod.UFASTCAST, 0)
                mobArg:setAnimationSub(0)
            end
        end
    end)

    -- Spirit Surge
    -- Should Be Used Every 5 Minutes, Set to 50% Health As Baseline (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    local timer = mob:getLocalVar('BSpiritSurgeTimer')
    if mob:getHPP() <= 50 then
        if os.time() > timer then
            mob:useMobAbility(1893)
            mob:setLocalVar('BSpiritSurgeTimer', os.time() + 300)
        end
    end

    -- En-doom When Spirit Surge Active (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    if mob:hasStatusEffect(xi.effect.SPIRIT_SURGE) then
        mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    else
        mob:setMobMod(xi.mobMod.ADD_EFFECT, 0)
    end

    -- Level Up Function
    -- Starts Level Up Sequence When Any Buff Is Gained (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    mob:addListener('EFFECT_GAIN', 'BUARAINECH_EFFECT_GAIN', function(mobArg, effect)
        if effect:getType() == xi.effect.SPIRIT_SURGE then
            mobArg:setLocalVar('LevelUp', 0)
        else
            if mobArg:getAnimationSub() == 0 then
                local levelupsum = mobArg:getLocalVar('TotalLevelUp')
                if levelupsum <= 30 then
                    mobArg:setLocalVar('LevelUp', 1)
                    mobArg:setLocalVar('TotalLevelUp', levelupsum + 1)
                    mobArg:setAnimationSub(1)
                else
                    mobArg:setLocalVar('LevelUp', 0)
                end
            end
        end
    end)

    -- Magic Retaliation
    -- Should Always Retaliate When Taking Magic Damage (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    mob:addListener('MAGIC_TAKE', 'BUARAINECH_MAGIC_TAKE', function(targetArg, caster, spell)
        if
            targetArg:getAnimationSub() == 0 and
            spell:tookEffect() and
            (caster:isPC() or caster:isPet())
        then
            targetArg:setLocalVar('BRetaliate', 1)
            targetArg:addEnmity(caster, 1000, 1000)
            targetArg:setAnimationSub(1)
        end
    end)

    -- Enmity Handling
    -- Mob Should Have Little To No Enmity Control (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    mob:addListener('TAKE_DAMAGE', 'BUARAINECH_TAKE_DAMAGE', function(mobArg, amount, attacker, attackType, damageType)
        if attackType == xi.attackType.PHYSICAL then
            mobArg:addEnmity(attacker, 1000, 1000)
        end
    end)

    mob:addListener('WEAPONSKILL_TAKE', 'BUARAINECH_WEAPONSKILL_TAKE', function(targetArg, attacker, skillid, tp, action)
        targetArg:addEnmity(attacker, 1000, 1000)
    end)
end

entity.OnSpellPrecast = function(caster, target, spell)
    -- AOE Stun (https://ffxiclopedia.fandom.com/wiki/Buarainech)
    if spell:getID() == 252 then
        caster:addStatusEffect(xi.effect.MANIFESTATION, 1, 0, 60)
    end
end

entity.onMobDisengage = function(mob)
    local levelupsum = mob:getLocalVar('TotalLevelUp')

    if
        mob:getHPP() < 100 or
        levelupsum > 0
    then
        DespawnMob(17449017)
        mob:setLocalVar('BFightTimer', 0)
        mob:setLocalVar('TotalLevelUp', 0)
        mob:setLocalVar('MobPoof', 1)
    end

    mob:removeListener('BUARAINECH_WEAPONSKILL_TAKE')
    mob:removeListener('BUARAINECH_TAKE_DAMAGE')
    mob:removeListener('BUARAINECH_MAGIC_TAKE')
    mob:removeListener('BUARAINECH_EFFECT_GAIN')
end

entity.onMobDrawIn = function(mob, target)
    mob:addTP(3000) -- Uses a mobskill upon drawing in a player. Not necessarily on the person drawn in.
        local drawInWait = mob:getLocalVar('DrawInWait')

    if
        target:getZPos() < -146.66 and
        os.time() > drawInWait
    then
        target:setPos(121.70, 7.00, -122.45)
        mob:messageBasic(232, 0, 0, target)
        mob:setLocalVar('DrawInWait', os.time() + 2)
    end
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
