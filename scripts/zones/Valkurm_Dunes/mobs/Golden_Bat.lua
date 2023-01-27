-----------------------------------
-- Area: Valkurm Dunes (103)
--   NM: Golden Bat
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 208)
end

return entity
