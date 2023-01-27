-----------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Sloth
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 186)
end

return entity
