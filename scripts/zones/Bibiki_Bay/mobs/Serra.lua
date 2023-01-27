-----------------------------------
-- Area: Bibiki Bay
--   NM: Serra
-----------------------------------
require('scripts/globals/hunts')
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 264)
end

return entity
