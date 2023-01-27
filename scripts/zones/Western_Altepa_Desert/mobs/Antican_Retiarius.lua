-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Antican Retiarius
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 135, 3, xi.regime.type.FIELDS)
end

return entity
