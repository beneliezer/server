-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Valley Manticore
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 140, 2, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 141, 2, xi.regime.type.FIELDS)
end

return entity
