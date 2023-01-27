-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Shrieker
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 656, 2, xi.regime.type.GROUNDS)
end

return entity
