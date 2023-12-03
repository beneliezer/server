-----------------------------------
-- NPC: Door
-- Area: Bhaflau Remnants
-- !st floor West entrance
-- Sets up mobs spawning, locks opposite side and unlocks exit to West wing
-- !pos 360 14 -500
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
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
        local random = math.random(100)
		
        xi.salvageUtil.onDoorOpen(npc, 1, 2)
        xi.salvageUtil.unsealDoors(npc, ID.npc[1].WEST_EXIT)
        xi.salvageUtil.sealDoors(npc, ID.npc[1].EAST_ENTRANCE)
        xi.salvageUtil.spawnStage(player)
		
        if random >= 50 then
            local instance = player:getInstance()
			
            if random >= 75 then
                instance:getEntity(bit.band(ID.mob[1].MAD_BOMBER, 0xFFF), xi.objType.MOB):setSpawn(260, 16, -291, 62)
                instance:getEntity(bit.band(ID.npc[1].DORMANT, 0xFFF), xi.objType.NPC):setPos(260, 16, -282, 62)
            else
                instance:getEntity(bit.band(ID.mob[1].MAD_BOMBER, 0xFFF), xi.objType.MOB):setSpawn(229, 16, -460, 125)
                instance:getEntity(bit.band(ID.npc[1].DORMANT, 0xFFF), xi.objType.NPC):setPos(237, 16, -460, 125)
            end
			
            SpawnMob(ID.mob[1].MAD_BOMBER, instance)
        end
    end
end

return entity
