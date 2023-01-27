-----------------------------------
-- Area: RoMaeve
--  Mob: Apocalyptic Weapon
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 122, 1, xi.regime.type.FIELDS)
end

return entity
