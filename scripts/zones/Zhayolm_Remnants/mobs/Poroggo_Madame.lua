-----------------------------------
-- Area: Zhayolm Remnants
-- MOB: Poroggo Madame
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()
    local mods = {[1] = xi.mod.FIRE_ABSORB, [2] = xi.mod.EARTH_ABSORB, [3] = xi.mod.WATER_ABSORB, [4] = xi.mod.WIND_ABSORB, [5] = xi.mod.ICE_ABSORB, [6] = xi.mod.LTNG_ABSORB, [7] = xi.mod.LIGHT_ABSORB, [8] = xi.mod.DARK_ABSORB}
    local enteringDay = instance:getLocalVar("dayElement") - 1

    mob:addMod(mods[enteringDay], 100)
    if enteringDay == xi.day.DARKSDAY then -- takes double dmg on Darksday
        mob:addMod(xi.mod.UDMGPHYS, 100)
        mob:addMod(xi.mod.UDMGBREATH, 100)
        mob:addMod(xi.mod.UDMGMAGIC, 100)
        mob:addMod(xi.mod.UDMGRANGE, 100)
    end
	
    mob:addMod(xi.mod.SPELLINTERRUPT, -20)
end

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()
    local stage = instance:getStage()

    instance:setLocalVar("killedNMs", instance:getLocalVar("killedNMs") + 1)

    if stage == 2 then
        xi.salvageUtil.handleSocketCells(mob, player)
    end

    if math.random(1,1000) >= 960 then
        local params = {}

        xi.salvageUtil.spawnTempChest(mob, params)
    end
end

return entity
