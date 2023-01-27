-----------------------------------
-- Area: East Ronfaure (101)
--   NM: Bigmouth Billy
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 151)
end

return entity
