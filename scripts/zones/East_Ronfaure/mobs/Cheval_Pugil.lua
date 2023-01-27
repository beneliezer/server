-----------------------------------
-- Area: East Ronfaure
--  Mob: Cheval Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 64, 1, xi.regime.type.FIELDS)
end

return entity
