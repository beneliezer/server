-----------------------------------
-- Area: Xarcabard
--   NM: Boreal Coeurl
-- Involved in Quests: Atop the Highest Mountains
-- !pos 580 -9 290 112
-----------------------------------
local ID = zones[xi.zone.XARCABARD]
-----------------------------------
local entity = {}

local pathNodes = 
{
    { x = 577.96, y = -9.61, z = 281.71,               }, --1
    { x = 580.38, y = -9.41, z = 272.25, wait = 10000, }, --2
    { x = 577.12, y = -7.94, z = 262.24,               }, --3
    { x = 581.12, y = -9.02, z = 253.25, wait = 10000, }, --4
    { x = 578.32, y = -9.43, z = 222.38,               }, --5
    { x = 551.64, y = -9.5,  z = 218.43, wait = 10000, }, --End Route (Linear)
    { x = 578.32, y = -9.43, z = 222.38,               }, --5
    { x = 581.12, y = -9.02, z = 253.25, wait = 10000, }, --4
    { x = 577.12, y = -7.94, z = 262.24,               }, --3
    { x = 580.38, y = -9.41, z = 272.25, wait = 10000, }, --2
    { x = 577.96, y = -9.61, z = 281.71,               }, --1
    { x = 582.73, y = -8.22, z = 295.79, wait = 10000, }, --Starting Point
}

entity.onMobSpawn = function(mob)
    -- Failsafe to make sure NPC is down when NM is up
    if xi.settings.main.OLDSCHOOL_G2 then
        GetNPCByID(ID.npc.BOREAL_COEURL_QM):showNPC(0)
    end

    --Have mob path through the pathNodes
    mob:pathThrough(pathNodes, bit.bor(xi.path.flag.PATROL))
end

entity.onMobDeath = function(mob, player, optParams)
    if xi.settings.main.OLDSCHOOL_G2 then
        -- show ??? for desired duration
        -- notify people on the quest who need the KI
        GetNPCByID(ID.npc.BOREAL_COEURL_QM):showNPC(xi.settings.main.FRIGICITE_TIME)
        if
            not player:hasKeyItem(xi.ki.SQUARE_FRIGICITE) and
            player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED
        then
            player:messageSpecial(ID.text.BLOCKS_OF_ICE)
        end
    end
end

return entity
