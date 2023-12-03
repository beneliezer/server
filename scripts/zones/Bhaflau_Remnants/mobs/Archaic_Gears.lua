-----------------------------------
-- Area: Bhaflau Remnants
--  MOB: Archaic Gears
--
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if firstCall then
        local instance = mob:getInstance()
        local stage = instance:getStage()

        if stage == 3 then
            local dormantTime = instance:getLocalVar("gearDeath")
            local time = os.time()
            if dormantTime == 0 then
                instance:setLocalVar("gearDeath", time + 6)
            elseif dormantTime >= time then
                if mob:getID() == 17084646 then
                    instance:getEntity(bit.band(ID.npc[3].DORMANT, 0xFFF), xi.objType.NPC):setPos(-497, -4, -420, 252)
                end
                instance:getEntity(bit.band(ID.npc[3].DORMANT, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
            end
        end
        if math.random(1,1000) >= 960 then
            local params = {}
            xi.salvageUtil.spawnTempChest(mob, params)
        end
    end
end

return entity
