-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Viscount Morax
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 356)
    player:addTitle(xi.title.HELLSBANE)
end

return entity
