-----------------------------------
-- Area: Gusgen Mines
--  Mob: Accursed Sorcerer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 679, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 680, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 686, 1, xi.regime.type.GROUNDS)
end

return entity
