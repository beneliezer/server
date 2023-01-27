-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Sacrificial Goblet
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 391)
end

return entity
