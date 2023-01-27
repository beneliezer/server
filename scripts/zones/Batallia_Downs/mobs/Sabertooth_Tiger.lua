-----------------------------------
-- Area: Batallia Downs
--  Mob: Sabertooth Tiger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 74, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 75, 1, xi.regime.type.FIELDS)
end

return entity
