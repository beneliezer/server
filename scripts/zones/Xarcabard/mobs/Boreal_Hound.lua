-----------------------------------
-- Area: Xarcabard
--   NM: Boreal Hound
-- Involved in Quests: Atop the Highest Mountains
-- !pos -21 -25 -490 112
-----------------------------------
local ID = zones[xi.zone.XARCABARD]
-----------------------------------
local entity = {}
local pathNodes =
{
    { x = -18.4410, y = -25.5000, z = -483.3090,               }, --1
    { x = -21.0231, y = -25.8439, z = -463.0654, wait = 10000, }, --2
    { x =  20.1315, y = -25.5506, z = -457.1963,               }, --3
    { x =  19.4559, y = -25.4443, z = -428.8622, wait = 10000, }, --End Route (linear)
    { x =  20.1315, y = -25.5506, z = -457.1963,               }, --3
    { x = -21.0231, y = -25.8439, z = -463.0654, wait = 10000, }, --2
    { x = -18.4410, y = -25.5000, z = -483.3090,               }, --1
    { x = -23.7353, y = -24.0938, z = -497.2978, wait = 10000, }, --Starting Point
}

entity.onMobSpawn = function(mob)
    -- Failsafe to make sure NPC is down when NM is up
    if xi.settings.main.OLDSCHOOL_G2 then
        GetNPCByID(ID.npc.BOREAL_HOUND_QM):showNPC(0)
    end

    --Have mob path through the pathNodes in a line
    mob:pathThrough(pathNodes, bit.bor(xi.path.flag.PATROL))
end

entity.onMobDeath = function(mob, player, optParams)
    if xi.settings.main.OLDSCHOOL_G2 then
        -- show ??? for desired duration
        -- notify people on the quest who need the KI
        GetNPCByID(ID.npc.BOREAL_HOUND_QM):showNPC(xi.settings.main.FRIGICITE_TIME)
        if
            not player:hasKeyItem(xi.ki.TRIANGULAR_FRIGICITE) and
            player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED
        then
            player:messageSpecial(ID.text.BLOCKS_OF_ICE)
        end
    end
end

return entity
