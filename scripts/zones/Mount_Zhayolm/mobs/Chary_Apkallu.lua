-----------------------------------
-- Area: Mount Zhayolm
--   NM: Chary Apkallu
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 456)
end

return entity
