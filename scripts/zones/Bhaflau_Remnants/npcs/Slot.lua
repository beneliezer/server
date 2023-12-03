
-----------------------------------
-- Area: Bhaflau Remnants
-- NPC: Slot
-- trade card to pop NM
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHasExactly(trade, xi.items.ARRAPAGO_CARD) then
        local instance = npc:getInstance()
		
        SpawnMob(ID.mob[3].JALAWAA, instance):updateClaim(player)
        player:confirmTrade()
    end
end

return entity
