-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Goblin Ambusher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 62, 2, xi.regime.type.FIELDS)
end

return entity
