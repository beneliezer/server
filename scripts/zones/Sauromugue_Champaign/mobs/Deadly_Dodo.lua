-----------------------------------
-- Area: Sauromugue Champaign
--   NM: Deadly Dodo
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 272)
end

return entity
