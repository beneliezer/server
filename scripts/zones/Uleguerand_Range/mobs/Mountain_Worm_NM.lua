-----------------------------------
-- Area: Uleguerand Range
--  Mob: Mountain Worm NM
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.REGEN, 50)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
end

return entity
