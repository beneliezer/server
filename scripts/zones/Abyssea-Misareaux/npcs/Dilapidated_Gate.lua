-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: Dilapidated Gate
-- !pos -259.55 -30.18 278.56
-----------------------------------
require('scripts/globals/abyssea')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local menu =
    {
        title = 'Proceed through the gate?',

        options =
        {
            {
                'Yes',
                function(playerArg)
                    playerArg:injectActionPacket(player:getID(), 6, 600, 0, 0, 0, 0, 0)

                    playerArg:timer(2000, function(playerArg2)
                        playerArg2:setPos(-403.38, -30.085, 340, 135)
                    end)

                    playerArg:timer(4000, function(playerArg2)
                        playerArg2:injectActionPacket(player:getID(), 6, 602, 0, 0, 0, 0, 0)
                    end)
                end,
            },
            {
                'No',
                function(playerArg)
                    return
                end,
            },
        },

        onCancelled = function(playerArg)
        end,
    }
    player:customMenu(menu)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
