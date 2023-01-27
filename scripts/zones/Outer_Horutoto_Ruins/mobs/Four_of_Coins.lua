-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Four of Coins
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 663, 4, xi.regime.type.GROUNDS)
end

return entity
