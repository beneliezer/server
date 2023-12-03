-----------------------------------
-- Door
-- Floor 3 Exit to South Portal
-- !pos 380 -6 400
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if npc:getLocalVar("unSealed") == 1 then
        player:startEvent(300)
    else
        player:messageSpecial(ID.text.DOOR_IS_SEALED)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 300 and option == 1 then
        xi.salvageUtil.onDoorOpen(npc)
        xi.salvageUtil.sealDoors(npc, ID.npc[3].DOORS)
    end
end

return entity
