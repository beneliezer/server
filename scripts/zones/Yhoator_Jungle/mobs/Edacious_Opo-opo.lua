-----------------------------------
-- Area: Yhoator Jungle
--   NM: Edacious Opo-opo
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 366)
end

return entity
