-----------------------------------
-- Area: Fei'Yin
--   NM: Goliath
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.GOLIATH_KILLER)
end

return entity
