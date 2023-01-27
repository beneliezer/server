-----------------------------------
-- Area: Yuhtunga Jungle
--   NM: Bayawak
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 363)
end

return entity
