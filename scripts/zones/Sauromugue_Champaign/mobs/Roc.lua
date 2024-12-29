-----------------------------------
-- Area: Sauromugue Champaign (120)
--  HNM: Roc
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobFight = function(mob, target)
    local drawInTable =
    {
        conditions =
        {
            target:checkDistance(mob) > mob:getMeleeRange(),
        },
        position = mob:getPos(),
        offset = 10,
        degrees = 180,
        wait = 15,
    }
    utils.drawIn(target, drawInTable)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.ROC_STAR)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end

return entity
