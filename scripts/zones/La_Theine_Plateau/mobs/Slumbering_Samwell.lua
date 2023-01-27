-----------------------------------
-- Area: La Theine Plateau
--   NM: Slumbering Samwell
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 155)
end

return entity
