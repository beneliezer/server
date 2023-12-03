-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Bhaflau)
-- !pos 620 -2 -202 72
-----------------------------------
-----------------------------------
local entity = {}

entity.onTrigger = function(player,npc)
    xi.salvageUtil.onSalvageTrigger(player, npc, 409, 9)
end

entity.onEventUpdate = function(player,csid,option,target)
    xi.salvageUtil.onSalvageUpdate(player, csid, option, target, 67, xi.zone.BHAFLAU_REMNANTS)
end

entity.onEventFinish = function(player,csid,option,target)
    if csid == 409 and option == 4 then
        player:setPos(0, 0, 0, 0, xi.zone.BHAFLAU_REMNANTS)
    end
end

entity.onInstanceCreated = function(player,target,instance)
    salvageUtil.onInstanceCreated(player, target, instance, 411, 9)
end

return entity
