-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Goblin Reaper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 113, 3, xi.regime.type.FIELDS)
end

return entity
