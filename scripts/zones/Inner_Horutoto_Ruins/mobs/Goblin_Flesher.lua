-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Flesher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 652, 2, xi.regime.type.GROUNDS)
end

return entity
