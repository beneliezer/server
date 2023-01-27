-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Greater Colibri
-----------------------------------
mixins = { require("scripts/mixins/families/colibri_mimic") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
