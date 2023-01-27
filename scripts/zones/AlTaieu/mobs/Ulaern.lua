-----------------------------------
-- Area: Al'Taieu
--  Mob: Ul'aern
-----------------------------------
mixins = { require("scripts/mixins/families/aern") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
