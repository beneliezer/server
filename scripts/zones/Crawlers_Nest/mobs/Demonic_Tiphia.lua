-----------------------------------
-- Area: Crawlers' Nest (197)
--  Mob: Demonic Tiphia
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 236)
end

return entity
