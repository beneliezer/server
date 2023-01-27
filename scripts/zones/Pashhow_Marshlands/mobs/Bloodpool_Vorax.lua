-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Bloodpool Vorax
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 211)
end

return entity
