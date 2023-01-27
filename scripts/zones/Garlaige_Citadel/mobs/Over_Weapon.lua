-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Over Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 705, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 708, 1, xi.regime.type.GROUNDS)
end

return entity
