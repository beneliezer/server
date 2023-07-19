-----------------------------------
-- Area: Dynamis - Jeuno
-- Mob: Arch_Goblin_Golem
-- !Spawnmob 17547499
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
