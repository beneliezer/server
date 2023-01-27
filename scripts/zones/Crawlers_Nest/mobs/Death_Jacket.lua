-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Death Jacket
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 687, 2, xi.regime.type.GROUNDS)
end

return entity
