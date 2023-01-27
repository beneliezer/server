-----------------------------------
-- Area: Quicksand Caves
--   NM: Diamond Daig
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 428)
end

return entity
