-----------------------------------
-- Area: Caedarva Mire
--  Mob: Heraldic Imp
-----------------------------------
mixins = { require("scripts/mixins/families/imp") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
