-----------------------------------
-- Daily Quest : Gronk
-- Daily Quest Reward NPC
-----------------------------------
require("modules/module_utils")
require("scripts/globals/zone")
require("scripts/zones/Lower_Jeuno/Zone")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("daily_quest_gronk")

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)

    -- Reward NPC
    local gronk = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Gronk",
        look = 73,
        x = -49.7539,
        y = 0.000,
        z = -54.3718,
        rotation = 19,
        widescan = 1,

        onTrade = function(player, npc, trade)
            player:PrintToPlayer("I don't require any items from you.", 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
            player:PrintToPlayer("This will be where you claim your Daily Quest rewards!", 0, npc:getPacketName())
        end,
    })

    utils.unused(gronk)
end)

return m
