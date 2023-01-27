-----------------------------------
-- Area: Fei'Yin
--  Mob: Balayang
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 717, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 718, 1, xi.regime.type.GROUNDS)
end

return entity
