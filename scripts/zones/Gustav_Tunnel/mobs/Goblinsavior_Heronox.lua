-----------------------------------
-- Area: Gustav Tunnel
--   NM: Goblinsavior Heronox
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 423)
end

return entity
