-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamie Deathdancer
-----------------------------------
mixins = { require("scripts/mixins/weapon_break") }
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
