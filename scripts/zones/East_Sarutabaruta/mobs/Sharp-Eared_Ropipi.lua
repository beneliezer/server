-----------------------------------
-- Area: East Sarutabaruta (116)
--   NM: Sharp-Eared Ropipi
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 254)
end

return entity
