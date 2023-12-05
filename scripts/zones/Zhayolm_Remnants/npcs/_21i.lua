-----------------------------------
-- Door
-- Floor 1 South East to Portal
-- !pos 380 -22 -520
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(300)
end

entity.onEventFinish = function(player, csid, option, npc)
    local instance = npc:getInstance()

    if csid == 300 and option == 1 then
        xi.salvageUtil.onDoorOpen(npc, nil, 1)
    end
end

return entity
