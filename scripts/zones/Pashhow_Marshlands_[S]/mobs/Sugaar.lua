-----------------------------------
-- Area: Pashhow Marshlands [S]
--   NM: Sugaar
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.PETRIFYRES, 10000)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.SILENCE, { chance = 15, duration = math.random(15, 30) })
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 508)
end

return entity
