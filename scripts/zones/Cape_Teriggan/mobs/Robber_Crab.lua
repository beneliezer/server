-----------------------------------
-- Area: Cape Teriggan
--  Mob: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 105, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 106, 1, xi.regime.type.FIELDS)
end

return entity
