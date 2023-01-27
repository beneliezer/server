-----------------------------------
-- Area: Xarcabard
--  Mob: Frost Gigas
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 54, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 55, 2, xi.regime.type.FIELDS)
end

return entity
