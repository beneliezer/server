-----------------------------------
-- Area: Caedarva Mire
--  Mob: Peallaidh
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 468)
end

return entity
