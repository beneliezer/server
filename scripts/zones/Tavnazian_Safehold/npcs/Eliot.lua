-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Eliot
-- !pos -103 -26 -49 26
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.DARKNESS_NAMED) then
        player:sendMenu(xi.menuType.AUCTION)
    -- TODO: Else 10916
    end
end

return entity
