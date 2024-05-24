-----------------------------------
-- Area: Lower Jeuno
--  NPC: Rakuru-Rakoru
-- Standard Merchant NPC
-----------------------------------
local ID = require('scripts/zones/Lower_Jeuno/IDs')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, {17546, 17552, 17560, 17556, 17554, 17550, 17548, 17558}) then
        player:tradeComplete()
        player:addItem(18633)
        player:messageSpecial( ID.text.ITEM_OBTAINED, 18633) -- Give Chatoyant Staff
    elseif npcUtil.tradeHas(trade, {15435, 15436, 15437, 15438, 15439, 15440, 15441, 15442}) then
        player:tradeComplete()
        player:addItem(28419,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 28419) -- Give Hachirin-no-Obi
    elseif npcUtil.tradeHas(trade, {17545, 17551, 17559, 17555, 17553, 17549, 17547, 17557}) then
        player:tradeComplete()
        player:addItem(18632,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 18632) -- Give Iridal Staff
    elseif npcUtil.tradeHas(trade, {15495, 15500, 15496, 15499, 15498, 15497, 15501, 15502}) then
        player:tradeComplete()
        player:addItem(27510,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 27510) -- Give Fotia Gorget
    end
end

entity.onTrigger = function(player, npc)
    player:printToPlayer('Rakuru-Rakoru: Trade me all eight elemental staves or their HQ\'s, and I\'ll give you a special gift in return. ', 0xD)
    player:printToPlayer('Rakuru-Rakoru: Trade me all eight elemental obis or gorgets, and I\'ll give you something even more extravagant! ', 0xD)
end

return entity
