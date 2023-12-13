-----------------------------------
--
-- Salvage: Zhayolm Remnants
--
-----------------------------------
local ID = zones[xi.zone.ZHAYOLM_REMNANTS]
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
    xi.salvageUtil.afterInstanceRegister(player, ID.text, xi.item.CAGE_OF_Z_REMNANTS_FIREFLIES)
end

instanceObject.onInstanceCreated = function(instance)
    instance:setStage(1)
    instance:setProgress(0)
    instance:setLocalVar('dayElement', VanadielDayElement() + 1) -- have to +1 due to firesday (0)
    instance:setLocalVar('timeEntered', os.time())
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    xi.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for i,players in pairs(chars) do
        players:messageSpecial(ID.text.MISSION_FAILED,10,10)
        players:startCutscene(1)
    end
end

instanceObject.onInstanceComplete = function(instance)
end

instanceObject.onTriggerAreaEnter = function(player, triggerArea)
    local instance = player:getInstance()
    local stage    = instance:getStage()
    local progress = instance:getProgress()

    print('Triggered Area: ' .. triggerArea:GetTriggerAreaID())

    if
        triggerArea:GetTriggerAreaID() == 8 or
        triggerArea:GetTriggerAreaID() == 9
    then -- 4th floor repeat mechanics
        if instance:getLocalVar('repeatFloor') == 0 then
            player:startCutscene(199 + triggerArea:GetTriggerAreaID()) -- continue like normal
        else
            if progress == 1 then
                player:startCutscene(205)
            else
                player:startCutscene(206)
            end
        end
    elseif
        triggerArea:GetTriggerAreaID() <= 11 and
        stage ~= 4
    then
        player:startCutscene(199 + triggerArea:GetTriggerAreaID())
    end
end

instanceObject.onInstanceProgressUpdate = function(instance, progress, elapsed)
end

instanceObject.onEventUpdate = function(player, csid, option)
    local instance = player:getInstance()
    local stage    = instance:getStage()
    local progress = instance:getProgress()

    if csid ~= 3 and option == 1 then
        if instance:getLocalVar('repeatFloor') == 0 then
            xi.salvageUtil.deSpawnStage(player)
        end

        xi.salvageUtil.resetTempBoxes(player)
    end

    if csid >= 200 and csid <= 203 then
        instance:setStage(2)
        instance:setProgress(csid - 199)
    elseif csid == 204 then
        instance:setStage(3)
        instance:setProgress(0)
    elseif csid == 205 then -- south path
        if instance:getStage() == 3 then -- came from previous floor
            instance:setStage(4)
            instance:setProgress(1)
            instance:setLocalVar('repeatFloor', 1)
        end
    elseif csid == 206 then -- north path
        if instance:getStage() == 3 then -- came from previous floor
            instance:setStage(4)
            instance:setProgress(math.random(2,3))
            instance:setLocalVar('repeatFloor', 1)
        end
    elseif csid == 207 then
        instance:setStage(5)
        instance:setProgress(2)
    elseif csid == 208 then
        instance:setStage(5)
        instance:setProgress(1)
    elseif csid == 209 then
        instance:setStage(6)
        instance:setProgress(1)
    elseif csid == 210 then
        instance:setStage(7)
        instance:setProgress(1)
    end
end

instanceObject.onEventFinish = function(player, csid, option)
    local instance = player:getInstance()
    local stage    = instance:getStage()
    local progress = instance:getProgress()
    local chars    = instance:getChars()

    print('Entering Salvage: Stage ' .. stage)

    if option == 1 then
        if csid >= 200 and csid <= 210 then
            xi.salvageUtil.teleportGroup(player)
            xi.salvageUtil.spawnStage(player)
            -- 2nd floor
            if csid == 200 then
                instance:getEntity(bit.band(ID.npc[stage].SOCKET, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
            elseif csid == 203 then
                instance:getEntity(bit.band(ID.npc[stage].SLOT, 0xFFF), xi.objType.NPC):setStatus(xi.status.NORMAL)
            -- to 3rd floor
            elseif csid == 204 then
                xi.salvageUtil.unsealDoors(player, ID.npc[3].DOORS)
            -- to 4th floor
            elseif csid == 205 or csid == 206 then
                local currentTime = os.time()
                -- 205 = South, 206 = North
                if csid == 205 then
                    local floorBoss = instance:getEntity(bit.band(ID.mob[4][1].POROGGO_MADAME, 0xFFF), xi.objType.MOB)

                    if
                        instance:getLocalVar('timeEntered') + (47 * 60) >= currentTime and
                        floorBoss:getLocalVar('spawned') == 0
                    then
                        SpawnMob(ID.mob[4][1].POROGGO_MADAME, instance)
                        floorBoss:setLocalVar('spawned', 1)
                    end
                elseif csid == 206 then
                    instance:setProgress(2)
                    local floorBoss = instance:getEntity(bit.band(ID.mob[4][2].POROGGO_MADAME, 0xFFF), xi.objType.MOB)

                    if
                        instance:getLocalVar('timeEntered') + (30 * 60) >= currentTime and
                        floorBoss:getLocalVar('spawned') == 0
                    then
                        SpawnMob(ID.mob[4][2].POROGGO_MADAME, instance)
                        floorBoss:setLocalVar('spawned', 1)
                    end
                end

                instance:getEntity(bit.band(ID.npc[stage][instance:getProgress()].DOOR, 0xFFF), xi.objType.NPC):setAnimation(9)
                instance:getEntity(bit.band(ID.npc[stage][instance:getProgress()].DOOR, 0xFFF), xi.objType.NPC):setUntargetable(false)
                instance:getEntity(bit.band(ID.npc[stage][instance:getProgress()].DOOR, 0xFFF), xi.objType.NPC):setLocalVar('unSealed', 0)
            -- to 5th floor
            elseif csid == 207 or csid == 208 then
                xi.salvageUtil.unsealDoors(player, ID.npc[stage][progress].DOOR)

                local count = xi.salvageUtil.removedPathos(player)

                if progress == 1 and count >= 3 then
                    SpawnMob(ID.mob[5][1].POROGGO_MADAME, instance)
                elseif progress == 2 and count >= 1 then
                    SpawnMob(ID.mob[5][2].POROGGO_MADAME, instance)
                end
            -- to 6th floor
            elseif csid == 209 then
                if instance:getLocalVar('killedNMs') >= 4 then
                    SpawnMob(ID.mob[6][1].POROGGO_MADAME, instance)
                end
            end
        end
    end
end

return instanceObject
