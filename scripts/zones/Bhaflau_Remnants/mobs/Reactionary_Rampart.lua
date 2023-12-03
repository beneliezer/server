-----------------------------------
-- Area: Reactionary Rampart
--  MOB: Bhaflau Remnants Floor 1
--  Spawns a mob every 10 - 15 seconds
--  Low chance of spawning NMs
-----------------------------------
-- mixins = {require("scripts/mixins/families/rampart")}
local ID = require("scripts/zones/Bhaflau_Remnants/IDs")
require("scripts/globals/instance")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
end

entity.onMobEngaged = function(mob, target)
    mob:AnimationSub(1)
    mob:setLocalVar("next", os.time())
end

entity.onMobFight = function(mob, target)
    local instance = mob:getInstance()
    local now = os.time()
    local next = mob:getLocalVar("next")
    local HP = mob:getHP()

    if now > next then
        local offset = mob:getID()
		
        for petid = offset + 1, offset + 5 do
            if not instance:getEntity(bit.band(petid, 0xFFF), xi.objType.MOB):isSpawned() then
                mob:setLocalVar("spawn", petid)
                break
            end
			
            mob:setLocalVar("spawn", 0)
        end

        mob:setLocalVar("next", now + math.random(10, 15))
        mob:useMobAbility(2034)
        mob:setHP(HP - (mob:getMaxHP() / 100))

        local petid = mob:getLocalVar("spawn")
        if petid > 0 then
            mob:setLocalVar("spawn", 0)
            local NM = instance:getEntity(bit.band(offset + 6, 0xFFF), xi.objType.MOB)
            mob:timer(2500, function(mob) if mob:isDead() then return end
                if math.random(100) > 97 and not NM:isSpawned() then
                    petid = offset + 6
                end
				
                SpawnMob(petid, instance)
                local pet = instance:getEntity(bit.band(petid, 0xFFF), xi.objType.MOB)
                local targ = mob:getTarget()
				
                if targ then
                    pet:updateEnmity(targ)
                end
            end)
        end
    end
end

entity.onMobDeath = function(mob, player, isKiller, firstCall)
    if mob:getLocalVar("Dead") == 0 then
        mob:setLocalVar("Dead", 1)
        local instance = mob:getInstance()
        local chars = instance:getChars()

        for i = mob:getID() + 1, mob:getID() + 6 do
            DespawnMob(i, instance)
        end

        for _, players in pairs(chars) do
            local progress = instance:getProgress()
            local stage = instance:getStage()
            local pos = ID.pos[stage][progress].exit

            players:startCutscene(5)
            players:timer(3800, function(mob) players:setPos(pos[1], pos[2], pos[3], pos[4]) end)
        end
    end
end

return entity
