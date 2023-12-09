-----------------------------------
-- Area: Zhayolm Remnants
-- NPC: Socket
-- Trade Salvage Cells to pop Poroggo Madame
-- Poroggo Madame drops 2x the Cells traded
-----------------------------------
local ID = require("scripts/zones/Zhayolm_Remnants/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local instance = npc:getInstance()
    local mob      = instance:getEntity(bit.band(ID.mob[2].POROGGO_MADAME, 0xFFF), xi.objType.MOB)
    local count    = trade:getItemCount()

    for i = xi.item.INCUS_CELL, xi.item.SPISSATUS_CELL do
        if count <= 5 and trade:hasItemQty(i, count) then
            SpawnMob(ID.mob[2].POROGGO_MADAME, instance):updateClaim(player)
            player:tradeComplete()
            mob:setLocalVar("Cell", i)
            mob:setLocalVar("Qnt", count)
            npc:setStatus(xi.status.DISAPPEAR)
        end
    end
end

return entity
