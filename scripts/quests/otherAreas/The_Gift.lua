-----------------------------------
-- The Gift
-----------------------------------
-- Log ID: 4, Quest ID: 21
-- Oswald  : !pos 47.119 -15.273 7.989 248
-----------------------------------
require('scripts/globals/quests')
require('scripts/globals/interaction/quest')
-----------------------------------

local quest = Quest:new(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_GIFT)

quest.reward =
{
    item = xi.item.SLEEP_DAGGER,
    title = xi.title.SAVIOR_OF_LOVE
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
            player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.UNDER_THE_SEA) == xi.questStatus.QUEST_COMPLETED and
            player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_SAND_CHARM) >= xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.SELBINA] =
        {
            ['Oswald'] = quest:event(70, xi.item.DANCESHROOM),

            onEventFinish =
            {
                [70] = function(player, csid, option, npc)
                    if option == 50 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.SELBINA] =
        {
            ['Oswald'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.DANCESHROOM) then
                        return quest:progressEvent(72, 0, xi.item.DANCESHROOM)
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:event(71)
                end,
            },

            onEventFinish =
            {
                [72] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
    {
        {
            check = function(player, status, vars)
                return status == xi.questStatus.QUEST_COMPLETED and
                player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_REAL_GIFT) == xi.questStatus.QUEST_AVAILABLE
            end,

            [xi.zone.SELBINA] =
            {
                ['Oswald'] = quest:event(78):replaceDefault(),
            },
        },
    },
}

return quest
