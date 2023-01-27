-----------------------------------
-- Area: Batallia Downs (105)
--  Mob: Tottering Toby
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 161)
end

return entity
