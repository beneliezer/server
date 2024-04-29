-----------------------------------
-- Area: Grauberg [S]
--   NM: Sarcopsylla
-----------------------------------
mixins = { require('scripts/mixins/families/chigoe') }
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 100)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ENFIRE, { power = math.random(25, 30) })
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 502)
end

return entity
