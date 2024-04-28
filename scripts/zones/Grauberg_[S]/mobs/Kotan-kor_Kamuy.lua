-----------------------------------
-- Area: Grauberg [S]
--   NM: Kotan-kor Kamuy
-- https://www.bg-wiki.com/ffxi/Kotan-kor_Kamuy
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN, { chance = 10, duration = 5 })
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 504)
end

return entity
