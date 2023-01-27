-----------------------------------
-- Area: South Gustaberg
--  Mob: Maneating Hornet
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 76, 1, xi.regime.type.FIELDS)
end

return entity
