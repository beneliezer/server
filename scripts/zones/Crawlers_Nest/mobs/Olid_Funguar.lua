-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Olid Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 694, 2, xi.regime.type.GROUNDS)
end

return entity
