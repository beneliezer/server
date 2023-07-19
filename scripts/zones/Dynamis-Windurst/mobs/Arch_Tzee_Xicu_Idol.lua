-----------------------------------
-- Area: Dynamis - Windurst
-- Mob: Arch_Tzee_Xicu_Idol
-- !Spawnmob 17543469
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
