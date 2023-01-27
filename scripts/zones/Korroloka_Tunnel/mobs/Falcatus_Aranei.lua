-----------------------------------
-- Area: Korroloka Tunnel
--   NM: Falcatus Aranei
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 227)
end

return entity
