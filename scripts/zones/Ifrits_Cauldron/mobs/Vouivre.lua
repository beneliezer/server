-----------------------------------
-- Area: Ifrits Cauldron
--   NM: Vouivre
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 402)
end

return entity
