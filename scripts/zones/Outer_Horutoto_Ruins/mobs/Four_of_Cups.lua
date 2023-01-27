-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Four of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 663, 1, xi.regime.type.GROUNDS)
end

return entity
