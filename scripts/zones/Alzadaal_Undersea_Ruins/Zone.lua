-----------------------------------
--
-- Zone: Alzadaal_Undersea_Ruins (72)
--
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    zone:registerTriggerArea(1, -329, -2, 483,-323, 0, 489)  -- map 1 SE porter
    zone:registerTriggerArea(2, -477, -2, 631,-471, 0, 636)  -- map 1 NW porter
    zone:registerTriggerArea(3,  110, -2,-556, 116, 0,-551)  -- map 2 west porter (white)
    zone:registerTriggerArea(4,   30, -2, 750,  36, 0, 757)  -- map 3 west porter (blue)
    zone:registerTriggerArea(5,   83, -2, 750,  90, 0, 757)  -- map 3 east porter (white)
    zone:registerTriggerArea(6, -329, -2, 150,-323, 0, 156)  -- map 4 porter (white)
    zone:registerTriggerArea(7, -208, -2,-556,-202, 0,-551)  -- map 5 porter (white)
    zone:registerTriggerArea(8,  323, -2, 591, 329, 0, 598)  -- map 6 east porter (white)
    zone:registerTriggerArea(9,  270, -2, 591, 276, 0, 598)  -- map 6 west porter (blue)
    zone:registerTriggerArea(10, 442, -2,-557, 450, 0,-550)  -- map 7 porter (white)
    zone:registerTriggerArea(11, -63,-10,  56, -57,-8,  62)  -- map 8 NW/Arrapago porter
    zone:registerTriggerArea(12,  17, -6,  56,  23,-4,  62)  -- map 8 NE/Silver Sea/Khim porter
    zone:registerTriggerArea(13, -63,-10, -23, -57,-8, -16)  -- map 8 SW/Zhayolm/bird camp porter
    zone:registerTriggerArea(14,  17, -6, -23,  23,-4, -16)  -- map 8 SE/Bhaflau Porter
    zone:registerTriggerArea(15,-556, -2, -77,-550, 0, -71)  -- map 9 east porter (white)
    zone:registerTriggerArea(16,-609, -2, -77,-603, 0, -71)  -- map 9 west porter (blue)
    zone:registerTriggerArea(17, 643, -2,-289, 649, 0,-283)  -- map 10 east porter (blue)
    zone:registerTriggerArea(18, 590, -2,-289, 597, 0,-283)  -- map 10 west porter (white)
    zone:registerTriggerArea(19, 603, -2, 522, 610, 0, 529)  -- map 11 east porter (blue)
    zone:registerTriggerArea(20, 550, -2, 522, 557, 0, 529)  -- map 11 west porter (white)
    zone:registerTriggerArea(21,-556, -2,-489,-550, 0,-483)  -- map 12 east porter (white)
    zone:registerTriggerArea(22,-610, -2,-489,-603, 0,-483)  -- map 12 west porter (blue)
    zone:registerTriggerArea(23,382, -1,-582,399, 1,-572)    -- mission 9 TOAU
    zone:registerTriggerArea(24, 54, -1, 749, 65, 1, 758)    -- Transformations quest part 1
    zone:registerTriggerArea(25, 135,-1, -557,143,1, -548)  -- Transformations quest part 2
end

zoneObject.onZoneIn = function(player,prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        if prevZone == xi.zone.ARRAPAGO_REMNANTS then
            player:setPos(-579, 0.05, -100, 192)
        elseif prevZone == xi.zone.ZHAYOLM_REMNANTS then
            player:setPos(-580, -0.5, -433, 64)
        elseif prevZone == xi.zone.BHAFLAU_REMNANTS then
            player:setPos(620, -0.5, -260.64, 72)
        elseif prevZone == SILVER_SEA_REMNANTS then
            player:setPos(580.000, -0.5, 500, 192)
        else
            player:setPos(222.798, -0.5, 19.872, 0)
        end
    end

    if player:getCurrentMission(TOAU) == PATH_OF_DARKNESS and player:getVar("AhtUrganStatus") == 2 then
        cs = 7
    elseif player:getCurrentMission(TOAU) == NASHMEIRAS_PLEA and player:getVar("AhtUrganStatus") == 2 then
        cs = 10
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
    player:entityVisualPacket("1pa1")
    player:entityVisualPacket("1pb1")
    player:entityVisualPacket("2pb1")
end

zoneObject.ontriggerAreaEnter = function(player,triggerArea)
    switch (triggerArea:GetTriggerAreaID()): caseof
    {
        [1] = function(x)
            player:startEvent(204)
        end,
        [2] = function(x)
            player:startEvent(205)
        end,
        [3] = function(x)
            player:startEvent(201)
        end,
        [4] = function(x)
            player:startEvent(203)
        end,
        [5] = function(x)
            player:startEvent(202)
        end,
        [6] = function(x)
            player:startEvent(206)
        end,
        [7] = function(x)
            player:startEvent(211)
        end,
        [8] = function(x)
            player:startEvent(200)
        end,
        [9] = function(x)
            player:startEvent(201)
        end,
        [10] = function(x)
            player:startEvent(213)
        end,
        [11] = function(x)
            player:startEvent(218)
        end,
        [12] = function(x)
            player:startEvent(221)
        end,
        [13] = function(x)
            player:startEvent(219)
        end,
        [14] = function(x)
            player:startEvent(220)
        end,
        [15] = function(x)
            player:startEvent(207)
        end,
        [16] = function(x)
            player:startEvent(208)
        end,
        [17] = function(x)
            player:startEvent(214)
        end,
        [18] = function(x)
            player:startEvent(207)
        end,
        [19] = function(x)
            player:startEvent(202)
        end,
        [20] = function(x)
            player:startEvent(207)
        end,
        [21] = function(x)
            player:startEvent(207)
        end,
        [22] = function(x)
            player:startEvent(210)
        end,
        [23] = function(x)
            if player:getCurrentMission(TOAU) == UNDERSEA_SCOUTING then
                player:startEvent(1, getMercenaryRank(player))
            end
        end,
        [24] = function(x)
            if player:getVar("TransformationsProgress") == 1 then
                player:startEvent(2)
            end
        end,
        [25] = function(x)
            if player:getVar("TransformationsProgress") == 2 then
                player:startEvent(3)
            end
        end,
    }
end

zoneObject.ontriggerAreaLeave = function(player,triggerArea)
end

zoneObject.onEventUpdate = function(player,csid,option)
    if csid == 1 and option == 10 then -- start
        player:updateEvent(0,0,0,0,0,0,0,0)
    elseif csid == 1 and option == 1 then -- windows
        player:setLocalVar("UnderseaScouting", player:getLocalVar("UnderseaScouting")+1)
        player:updateEvent(player:getLocalVar("UnderseaScouting"),0,0,0,0,0,0,0)
    elseif csid == 1 and option == 2 then -- pillars
        player:setLocalVar("UnderseaScouting", player:getLocalVar("UnderseaScouting")+2)
        player:updateEvent(player:getLocalVar("UnderseaScouting"),0,0,0,0,0,0,0)
    elseif csid == 1 and option == 3 then -- floor
        player:setLocalVar("UnderseaScouting", player:getLocalVar("UnderseaScouting")+4)
        player:updateEvent(player:getLocalVar("UnderseaScouting"),0,0,0,0,0,0,0)
    end
end

zoneObject.onEventFinish = function(player,csid,option)
    if csid == 1 then
        npcUtil.giveKeyItem(player, xi.ki.ASTRAL_COMPASS)
        player:completeMission(TOAU, UNDERSEA_SCOUTING)
        player:addMission(TOAU, ASTRAL_WAVES)
    elseif csid == 2 then
        player:setVar("TransformationsProgress", 2)
    elseif csid == 3 then
        player:setVar("TransformationsProgress", 3)
    elseif csid == 7 then
        player:completeMission(TOAU,PATH_OF_DARKNESS)
        player:setTitle(xi.title.NAJAS_COMRADEINARMS)
        player:setVar("AhtUrganStatus",0)
        player:addMission(TOAU,FANGS_OF_THE_LION)
    elseif csid == 10 then
        player:completeMission(TOAU,NASHMEIRAS_PLEA)
        player:setTitle(xi.title.PREVENTER_OF_RAGNAROK)
        player:setVar("AhtUrganStatus",0)
        player:addMission(TOAU,RAGNAROK)
    elseif csid == 411 then
        local area = player:getLocalVar("Area")
        if area == 5 then
            player:setPos(0, 0, 0, 0, xi.zone.NYZUL_ISLE)
        elseif area == 7 then
            player:setPos(0, 0, 0, 0, xi.zone.ZHAYOLM_REMNANTS)
        elseif area == 8 then
            player:setPos(0, 0, 0, 0, xi.zone.ARRAPAGO_REMNANTS)
        elseif area == 9 then
            player:setPos(0, 0, 0, 0, xi.zone.BHAFLAU_REMNANTS)
        elseif area == 10 then
            player:setPos(0, 0, 0, 0, xi.zone.SILVER_SEA_REMNANTS)
        end
    end
end

return zoneObject