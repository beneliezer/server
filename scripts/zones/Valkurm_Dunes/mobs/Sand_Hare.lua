-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Sand Hare
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 7, 2, xi.regime.type.FIELDS)
end

return entity
