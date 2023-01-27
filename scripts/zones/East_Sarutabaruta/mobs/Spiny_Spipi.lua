-----------------------------------
-- Area: East Sarutabaruta
--   NM: Spiny Spipi
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 253)
end

return entity
