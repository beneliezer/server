-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Processionaire
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 724, 1, xi.regime.type.GROUNDS)
end

return entity
