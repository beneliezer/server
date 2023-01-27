-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Goblin Butcher
-----------------------------------
require("scripts/globals/regimes")
require("scripts/quests/tutorial")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 84, 3, xi.regime.type.FIELDS)
    xi.tutorial.onMobDeath(player)
end

return entity
