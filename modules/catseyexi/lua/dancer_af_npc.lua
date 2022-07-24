-------------------------------------------------------
require("modules/module_utils")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/equipment")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/quests")
local ID = require("scripts/zones/Bastok_Markets/IDs")
-------------------------------------------------------	
local m = Module:new("dancer_af_npc")

m:addOverride("xi.zones.Bastok_Markets.npcs.Matthias.onTrade", function(player, npc, trade)
	
        if player:hasCompletedQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_ROAD_TO_DIVADOM) then
		   if npcUtil.tradeHasExactly(trade, {2340, 1991, 2010}) then
                player:tradeComplete()
                player:addItem(16138)
                player:messageSpecial( ID.text.ITEM_OBTAINED, 16138) -- Give Dancer's Tiara
            elseif npcUtil.tradeHasExactly(trade, {2289, 1636, 1999}) then
                player:tradeComplete()
                player:addItem(15746)
                player:messageSpecial(ID.text.ITEM_OBTAINED, 15746) -- Give Dancer's Toe Shoes
            elseif npcUtil.tradeHasExactly(trade, {2288, 830, 1996}) then
                player:tradeComplete()
                player:addItem(15002)
                player:messageSpecial(ID.text.ITEM_OBTAINED, 15002) -- Give Dancer's Bangles
            end
        end
end)

m:addOverride("xi.zones.Bastok_Markets.npcs.Matthias.onTrigger", function(player, npc)
	
        if player:hasCompletedQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_ROAD_TO_DIVADOM) then
        player:PrintToPlayer("If it's gear you seek, just trade me the items I ask for to get what you desire!", 0xD)		
		else
		player:PrintToPlayer("Matthias: Go away I have nothing for you!", 0xD)
        end
end)
return m