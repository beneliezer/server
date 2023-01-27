-----------------------------------
-- Area: Al'Taieu
--  Mob: Om'phuabo
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
mixins = { require("scripts/mixins/families/phuabo") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
