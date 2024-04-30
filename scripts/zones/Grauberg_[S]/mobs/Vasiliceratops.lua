-----------------------------------
-- Area: Grauberg [S]
--   NM: Vasiliceratops
-- https://www.bg-wiki.com/ffxi/Vasiliceratops
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 100)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 505)
end

return entity
