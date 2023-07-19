-----------------------------------
-- Area: Dynamis - San d'Oria
-- Mob: Arch_Overlord_Tombstone
-- !Spawnmob 17535213
-----------------------------------
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

return entity
