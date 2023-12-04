-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Zhayolm)
-- !pos -580 0 -405 72
-----------------------------------
-----------------------------------
local entity = {}

entity.onTrigger = function(player,npc)
    xi.salvageUtil.onSalvageTrigger(player, npc, 407, 7)
end

entity.onEventUpdate = function(player,csid,option,target)
    xi.salvageUtil.onSalvageUpdate(player, csid, option, target, 61, xi.zone.ZHAYOLM_REMNANTS)
end

entity.onEventFinish = function(player,csid,option,target)
    if csid == 407 and option == 4 then
        player:setPos(0, 0, 0, 0, xi.zone.ZHAYOLM_REMNANTS)
    end
end

entity.onInstanceCreated = function(player,target,instance)
    xi.salvageUtil.onInstanceCreated(player, target, instance, 411, 7)
end

return entity
