-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Sabotender Mariachi
-- TODO: Auto-Regen during the day
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 417)
end

return entity
