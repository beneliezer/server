-----------------------------------
-- Trust: Lion
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell, 1009)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    -- Stun all the things!
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0,
                        ai.r.MA, ai.s.SPECIFIC, 3198) -- Grape Shot (Stun)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0,
                        ai.r.MA, ai.s.SPECIFIC, 3198) -- Grape Shot (Stun)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0,
                        ai.r.MA, ai.s.SPECIFIC, 3198) -- Grape Shot (Stun)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0,
                        ai.r.MA, ai.s.SPECIFIC, 3198) -- Grape Shot (Stun)

    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM, 1000)
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject
