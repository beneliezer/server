-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Helm Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 692, 1, xi.regime.type.GROUNDS)
end

return entity
