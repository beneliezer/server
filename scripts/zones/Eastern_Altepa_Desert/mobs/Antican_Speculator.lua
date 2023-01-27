-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Speculator
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 112, 3, xi.regime.type.FIELDS)
end

return entity
