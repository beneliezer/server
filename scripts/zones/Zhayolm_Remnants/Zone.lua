-----------------------------------
--
-- Zone: Zhayolm Remnants
--
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
require("scripts/globals/instance")
-----------------------------------
local zoneObject = {}

zoneObject.onZoneIn = function(player, prevZone)
end

zoneObject.onInitialize = function(zone)
    zone:registerTriggerArea(1,   420, 5, -340, 0, 0, 0)
    zone:registerTriggerArea(1,   420.274, 15, -499.958, 0, 0, 0) -- 1st Floor, Teleporter 1 -> 2nd Floor, SouthWest Room
    zone:registerTriggerArea(3,   260, 5, -500, 0, 0, 0)
    zone:registerTriggerArea(4,   260, 5, -340, 0, 0, 0)
    zone:registerTriggerArea(5,   340, 5,  -60, 0, 0, 0)
    zone:registerTriggerArea(6,   340, 5,  420, 0, 0, 0)
    zone:registerTriggerArea(7,   340, 5,  500, 0, 0, 0)
    zone:registerTriggerArea(8,  -380, 5, -620, 0, 0, 0)
    zone:registerTriggerArea(9,  -300, 5, -460, 0, 0, 0)
    zone:registerTriggerArea(10, -340, 5, -100, 0, 0, 0)
    zone:registerTriggerArea(11, -340, 5,  140, 0, 0, 0)
end

zoneObject.onInstanceZoneIn = function(player, zone, instance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventFinish = function(player, csid, option)
    if csid == 202 and option == 1 then
        player:setPos(260, -0.5, -140, 127)     -- 2nd Floor, Southwest Room
    end
    -- instanceKickOut(player, csid, 1, xi.zone.ALZADAAL_UNDERSEA_RUINS)
end

zoneObject.onInstanceLoadFailed = function()
    return xi.zone.ALZADAAL_UNDERSEA_RUINS
end

zoneObject.onInstanceLoadFailed = function()
    return xi.zone.ALZADAAL_UNDERSEA_RUINS
end

return zoneObject