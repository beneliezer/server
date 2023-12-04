-----------------------------------
-- Area: Zhayolm Remnants
--   NM: Battleclad Chariot
-----------------------------------
mixins = {require("scripts/mixins/families/chariot")}
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addMobMod(xi.mobMod.NO_MOVE, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.STAR_CHARIOTEER)
end

return entity
