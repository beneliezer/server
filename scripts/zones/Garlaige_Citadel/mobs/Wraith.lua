-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Wraith
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 708, 3, xi.regime.type.GROUNDS)
end

return entity
