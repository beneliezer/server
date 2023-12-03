-----------------------------------
--
-- Zone: Bhaflau_Remnants
--
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/instance")
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    zone:registerTriggerArea(1,  340, 8, -420, 0, 0, 0)
    zone:registerTriggerArea(2,  260, 8,  300, 0, 0, 0)
    zone:registerTriggerArea(3,  300, 8,   60, 0, 0, 0)
    zone:registerTriggerArea(4,  420, 8,  300, 0, 0, 0)
    zone:registerTriggerArea(5,  380, 8,   60, 0, 0, 0)
    zone:registerTriggerArea(6, -460, 8, -500, 0, 0, 0)
    zone:registerTriggerArea(7, -220, 8, -500, 0, 0, 0)
    zone:registerTriggerArea(8, -340, 8,   60, 0, 0, 0)
end

zoneObject.onInstanceZoneIn = function(player, instance)
    InstanceOnZoneIn(player, instance, 1)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    instanceKickOut(player, csid, 1, xi.zone.ALZADAAL_UNDERSEA_RUINS)
end

zoneObject.onInstanceLoadFailed = function()
    return xi.zone.ALZADAAL_UNDERSEA_RUINS
end

return zoneObject