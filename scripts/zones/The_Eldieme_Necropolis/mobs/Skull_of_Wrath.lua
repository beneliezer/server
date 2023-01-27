-----------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Wrath
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 190)
end

return entity
