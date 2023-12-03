-----------------------------------
-- Area: Zhayolm Remnants
-- NPC: Slot
-- trade card to pop NM
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, xi.items.SILVER_SEA_CARD) then
        local instance = npc:getInstance()
		
        SpawnMob(ID.mob[2].JAKKO, instance):updateClaim(player)
        player:confirmTrade()
        npc:setStatus(xi.status.DISAPPEAR)
    end
end

return entity
