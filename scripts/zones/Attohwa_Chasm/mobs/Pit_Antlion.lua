-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Pit Antlion
-----------------------------------
mixins = { require("scripts/mixins/families/antlion_ambush") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
