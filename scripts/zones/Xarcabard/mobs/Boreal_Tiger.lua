-----------------------------------
-- Area: Xarcabard
--   NM: Boreal Tiger
-- Involved in Quests: Atop the Highest Mountains
-- !pos 341 -29 370 112
-----------------------------------
local ID = zones[xi.zone.XARCABARD]
-----------------------------------
local entity = {}

local pathNodes =
{
    { x = 337.9954, y = -29.5299, z = 361.3245,               }, --1
    { x = 342.8453, y = -28.8822, z = 332.5426, wait = 10000, }, --2
    { x = 338.6599, y = -29.5000, z = 322.2945,               }, --3
    { x = 341.6884, y = -29.5000, z = 313.7332,               }, --4
    { x = 339.5544, y = -29.1977, z = 304.9787, wait = 10000, }, --End Route (linear)
    { x = 341.6884, y = -29.5000, z = 313.7332,               }, --4
    { x = 338.6599, y = -29.5000, z = 322.2945                }, --3
    { x = 342.8453, y = -28.8822, z = 332.5426, wait = 10000, }, --2
    { x = 337.9954, y = -29.5299, z = 361.3245,               }, --1
    { x = 344.0574, y = -28.0623, z = 378.4861, wait = 10000, }, --Starting Point
}

entity.onMobSpawn = function(mob)
    -- Failsafe to make sure NPC is down when NM is up
    if xi.settings.main.OLDSCHOOL_G2 then
        GetNPCByID(ID.npc.BOREAL_TIGER_QM):showNPC(0)
    end

    --Have mob path through the pathNodes in a line
    mob:pathThrough(pathNodes, bit.bor(xi.path.flag.PATROL))
end

entity.onMobDeath = function(mob, player, optParams)
    if xi.settings.main.OLDSCHOOL_G2 then
        -- show ??? for desired duration
        -- notify people on the quest who need the KI
        GetNPCByID(ID.npc.BOREAL_TIGER_QM):showNPC(xi.settings.main.FRIGICITE_TIME)
        if
            not player:hasKeyItem(xi.ki.ROUND_FRIGICITE) and
            player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.ATOP_THE_HIGHEST_MOUNTAINS) == QUEST_ACCEPTED
        then
            player:messageSpecial(ID.text.BLOCKS_OF_ICE)
        end
    end
end

return entity
