-----------------------------------
-- Area: Lufaise Meadows
--   NM: Yal-un Eke
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 440)
end

return entity
