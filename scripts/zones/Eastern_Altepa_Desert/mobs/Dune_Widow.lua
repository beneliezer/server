-----------------------------------
-- Area: Eastern Altepa Desert (114)
--   NM: Dune Widow
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 408)
end

return entity
