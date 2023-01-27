-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Goblin Shepherd
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 757, 1, xi.regime.type.GROUNDS)
end

return entity
