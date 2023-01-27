-----------------------------------
-- Area: Qufim Island
--   NM: Trickster Kinetix
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 307)
end

return entity
