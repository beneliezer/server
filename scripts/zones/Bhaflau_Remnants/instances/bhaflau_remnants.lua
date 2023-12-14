-----------------------------------
--
-- Salvage: Bhaflau Remnants
--
-----------------------------------
local ID = zones[xi.zone.BHAFLAU_REMNANTS]
-----------------------------------
local instanceObject = {}

-- Once the instance is ready inform the requester that it's ready
instanceObject.onInstanceCreatedCallback = function(player, instance)
    xi.instance.onInstanceCreatedCallback(player, instance)

    -- Kill the Nyzul Isle update spam
    for _, v in ipairs(player:getParty()) do
        if v:getZoneID() == instance:getEntranceZoneID() then
            v:updateEvent(409, 3, 3, 3, 3, 3, 3, 3)
        end
    end
end

instanceObject.afterInstanceRegister = function(player)
    xi.salvageUtil.afterInstanceRegister(player, ID.text, xi.item.CAGE_OF_B_REMNANTS_FIREFLIES)
end

instanceObject.onInstanceCreated = function(instance)
    instance:setStage(1)
    instance:setProgress(0)
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    xi.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for _, players in pairs(chars) do
        players:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        players:startCutscene(1)
    end
end

instanceObject.onTriggerAreaEnter = function(player, triggerArea, instance)
    local triggerAreaID = triggerArea:GetTriggerAreaID()

    if triggerAreaID <= 8 then
        player:startCutscene(199 + triggerAreaID)
    end
end

instanceObject.onEventUpdate = function(player, csid, option)
    local instance = player:getInstance()

    if csid ~= 3 then
        xi.salvageUtil.deSpawnStage(player)
        xi.salvageUtil.resetTempBoxes(player)
    end
    if option ==1 then
        if csid == 200 then
            instance:setStage(2)
            instance:setProgress(0)
            xi.salvageUtil.unsealDoors(player, ID.npc[2].EAST_ENTRANCE)
            xi.salvageUtil.unsealDoors(player, ID.npc[2].WEST_ENTRANCE)
        elseif csid >= 201 and csid <= 204 then
            instance:setStage(3)
            instance:setProgress(csid - 200)
        elseif csid >= 205 and csid <= 206 then
            instance:setStage(4)
            instance:setProgress(csid - 204)
        elseif csid == 207 then
            instance:setStage(5)
            instance:setProgress(0)
            xi.salvageUtil.unsealDoors(player, ID.npc[5].DOOR1)
        end
    end
end

instanceObject.onEventFinish = function(player, csid, option)
    local instance = player:getInstance()

    if option == 1 then
        if csid >= 200 and csid <= 207 then
            xi.salvageUtil.teleportGroup(player)
            xi.salvageUtil.spawnStage(player)
        end
    end
end

return instanceObject
