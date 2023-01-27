-----------------------------------
-- Area: Palborough Mines
--   NM: Zi'Ghi Boneeater
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 220)
end

return entity
