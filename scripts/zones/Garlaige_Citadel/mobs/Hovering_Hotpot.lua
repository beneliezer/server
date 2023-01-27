-----------------------------------
-- Area: Garlaige Citadel (164)
--   NM: Hovering Hotpot
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 301)
end

return entity
