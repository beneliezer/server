-----------------------------------
-- Area: The Boyahda Tree
--   NM: Ellyllon
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 357)
end

return entity
