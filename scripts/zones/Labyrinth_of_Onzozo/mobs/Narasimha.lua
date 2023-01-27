-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Narasimha
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 299)
end

return entity
