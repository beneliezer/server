-----------------------------------
-- Area: Bhaflau Remnants
-- MOB: Flux Flan
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
mixins = {require("scripts/mixins/families/flan")}
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()
	
    instance:getEntity(bit.band(ID.npc[2].SOCKET, 0xFFF), xi.objType.NPC):setStatus(xi.status.DISAPPEAR)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.salvageUtil.handleSocketCells(mob, player)
end

return entity
