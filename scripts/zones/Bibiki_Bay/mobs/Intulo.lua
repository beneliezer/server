-----------------------------------
-- Area: Bibiki Bay
--   NM: Intulo
-----------------------------------
require('scripts/globals/hunts')
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 265)
end

return entity
