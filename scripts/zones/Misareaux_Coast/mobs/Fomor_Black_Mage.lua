-----------------------------------
-- Area: Misareaux_Coast
--  Mob: Fomor Black Mage
-----------------------------------
mixins = { require("scripts/mixins/fomor_hate") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
