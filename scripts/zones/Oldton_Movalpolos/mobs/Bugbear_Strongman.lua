-----------------------------------
-- Area: Oldton Movalpolos
--   NM: Bugbear Strongman
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 244)
end

return entity
