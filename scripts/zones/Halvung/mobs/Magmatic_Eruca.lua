-----------------------------------
-- Area: Halvung
--  Mob: Magmatic Eruca
-----------------------------------
mixins = { require("scripts/mixins/families/eruca") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
