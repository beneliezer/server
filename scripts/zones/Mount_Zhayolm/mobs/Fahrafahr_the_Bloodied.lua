-----------------------------------
-- Area: Mount Zhayolm
--   NM: Fahrafahr the Bloodied
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 458)
end

return entity
