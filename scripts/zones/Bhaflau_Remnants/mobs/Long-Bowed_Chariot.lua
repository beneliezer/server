-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Long-Bowed_Chariot
-----------------------------------
mixins = {require("scripts/mixins/families/chariot")}
-----------------------------------
entity = {}

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()

    mob:addImmunity(xi.immunity.BIND)
    mob:addImmunity(xi.immunity.SLEEP)
    mob:addMobMod(xi.mobMod.NO_MOVE, 1)
    mob:addResist({ xi.resist.ENFEEBLING_STUN, 75, 0 })
    if instance:getLocalVar("bossModifier") == 1 then
        mob:addMod(xi.mod.DEF, -100)
        mob:addMod(xi.mod.MDEF, -100)
    elseif instance:getLocalVar("bossModifier") == 2 then
        mob:addMod(xi.mod.ATTACK, -100)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.COMET_CHARIOTEER)
end

return entity
