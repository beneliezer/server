-----------------------------------
-- Area: Beaucedine Glacier [S]
--  Mob: Gargouille
-- Note: PH for Grand'Goule
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier_[S]/IDs")
require("scripts/globals/mobs")
mixins = { require("scripts/mixins/families/gargouille") }
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
end

entity.onMobRoam = function(mob)
end

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.GRANDGOULE_PH, 10, 3600) -- 1 hour
end

return entity
