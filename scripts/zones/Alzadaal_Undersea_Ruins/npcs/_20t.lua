-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Arrapago)
-- !pos -580 0 -159 72
-----------------------------------
local ID = zones[xi.zone.ALZADAAL_UNDERSEA_RUINS]
-----------------------------------
local entity = {}

entity.onTrigger = function(player,npc)
    xi.salvageUtil.onSalvageTrigger(player, npc, 410, 10)
end

entity.onEventUpdate = function(player,csid,option,target)
    xi.salvageUtil.onSalvageUpdate(player, csid, option, target, 70, xi.zone.SILVER_SEA_REMNANTS)
end

entity.onEventFinish = function(player,csid,option,target)
    if csid == 410 and option == 4 then
        player:setPos(0, 0, 0, 0, xi.zone.SILVER_SEA_REMNANTS)
    end
end

entity.onInstanceCreated = function(player,target,instance)
    xi.salvageUtil.onInstanceCreated(player, target, instance, 411, 10)
end

return entity
