-----------------------------------
-- Daily Quest : Fishstix
-- Find/open a secret Treasure Chest in a certain zone
-----------------------------------
require("modules/module_utils")
require("scripts/globals/zone")
require("scripts/zones/Lower_Jeuno/Zone")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("daily_quest_fishstix")

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)

    local questLocations =
    {
        -- [index] | Zone Name
        [1] = {"West Ronfaure"},
        [2] = {"East Ronfaure"},
        [3] = {"South Gustaberg"},
        [4] = {"North Gustaberg"},
        [5] = {"West Sarutabaruta"},
        [6] = {"East Sarutabaruta"},
        [7] = {"La Theine Plateau"},
        [8] = {"Konschtat Highlands"},
        [9] = {"Tahrongi Canyon"},
        [10] = {"Valkurm Dunes"},
        [11] = {"Jugner Forest"},
        [12] = {"Batallia Downs"},
        [13] = {"Pashhow Marshlands"},
        [14] = {"Rolanberry Fields"},
        [15] = {"Sauromugue Champaign"},
        [16] = {"Beaucedine Glacier"},
        [17] = {"Xarcabard"},
        [18] = {"Cape Teriggan"},
        [19] = {"Eastern Altepa Desert"},
        [20] = {"Western Altepa Desert"},
        [21] = {"Meriphataud Mountains"},
        [22] = {"Buburimu Peninsula"},
        [23] = {"The Sanctuary of Zi'Tah"},
        [24] = {"Ro'Maeve"},
        [25] = {"Yuhtunga Jungle"},
        [26] = {"Yhoator Jungle"},
        [27] = {"Qufim Island"},
        [28] = {"Temple of Uggalepih"},
        [29] = {"Valley of Sorrows"},
        [30] = {"Bibiki Bay"},
        [31] = {"Carpenter's Landing"},
        [32] = {"Uleguerand Range"},
        [33] = {"Attohwa Chasm"},
        [34] = {"Oldton Movalpolos"},
        [35] = {"Newton Movalpolos"},
        [36] = {"Wajaom Woodlands"},
        [37] = {"Bhaflau Thickets"},
        [38] = {"Arrapago Reef"},
        [39] = {"Mount Zhayolm"},
        [40] = {"Halvung"},
        [41] = {"Mamook"},
        [42] = {"Aydeewa Subterrane"},
        [43] = {"Alzadaal Undersea Ruins"},
        [44] = {"Nyzul Isle"},
        [45] = {"Caedarva Mire"},
        [46] = {"Yughott Grotto"},
        [47] = {"Fort Ghelsba"},
        [48] = {"Palborough Mines"},
        [49] = {"Giddeus"},
        [50] = {"Beadeaux"},
        [51] = {"Davoi"},
        [52] = {"Monastic Cavern"},
        [53] = {"Castle Oztroja"},
        [54] = {"The Boyahda Tree"},
        [55] = {"Lower Delkfutt's Tower"},
        [56] = {"Middle Delkfutt's Tower"},
        [57] = {"Upper Delkfutt's Tower"},
        [58] = {"Den of Rancor"},
        [59] = {"Castle Zvahl Baileys"},
        [60] = {"Castle Zvahl Keep"},
        [61] = {"Ranguemont Pass"},
        [62] = {"Bostaunieux Oubliette"},
        [63] = {"Toraimarai Canal"},
        [64] = {"Zeruhn Mines"},
        [65] = {"Korroloka Tunnel"},
        [66] = {"Kuftal Tunnel"},
        [67] = {"The Eldieme Necropolis"},
        [68] = {"Sea Serpent Grotto"},
        [69] = {"Dangruf Wadi"},
        [70] = {"Inner Horutoto Ruins"},
        [71] = {"Outer Horutoto Ruins"},
        [72] = {"Ordelle's Caves"},
        [73] = {"Gusgen Mines"},
        [74] = {"Crawler's Nest"},
        [75] = {"Maze of Shakhrami"},
        [76] = {"Garlaige Citadel"},
        [77] = {"Fei'Yin"},
        [78] = {"Ifrit's Cauldron"},
        [79] = {"Quicksand Caves"},
        [80] = {"Gustav Tunnel"},
        [81] = {"Labyrinth of Onzozo"},
        [82] = {"Dynamis - Bastok"},
        [83] = {"Dynamis - San d'Oria"},
        [84] = {"Dynamis - Windurst"},
        [85] = {"Dynamis - Jeuno"},
        [86] = {"Dynamis - Beaucedine"},
        [87] = {"Dynamis - Xarcabard"},
        [88] = {"Ru'Aun Gardens"},
        [89] = {"Ve'Lugannon Palace"},
        [90] = {"The Shrine of Ru'Avitau"},
        [91] = {"Al'Taieu"},
        [92] = {"Grand Palace of Hu'Xzoi"},
        [93] = {"The Garden of Ru'Hmet"},
        [94] = {"Lufaise Meadows"},
        [95] = {"Misareaux Coast"},
        [96] = {"Phomiuna Aqueducts"},
        [97] = {"Sacrarium"},
        [98] = {"Riverne Site-A01"},
        [99] = {"Riverne Site-B01"},
        [100] = {"Escha - Zi'Tah"},
        [101] = {"Escha - Ru'Aun"}
    }

    local handleMidnight = function(player)
        local questMidnight = player:getCharVar("[DailyQuest]Midnight")
        local currentMidnight = getMidnight()

        -- handle first time quest midnight
        if questMidnight == 0 then
            player:setCharVar("[DailyQuest]Midnight",currentMidnight)
            player:setCharVar("[DailyQuest]Completed",0)
            player:setCharVar("[DailyQuest]Fishstix",0)
            player:setCharVar("[DailyQuest]Murdoc",0)
            player:setCharVar("[DailyQuest]Mistrix",0)
            player:setCharVar("[DailyQuest]Saltlik",0)
            player:setCharVar("[DailyQuest]Beetrix",0)
        end
        
        -- handle midnight reset
        if currentMidnight < questMidnight then
            player:setCharVar("[DailyQuest]Midnight",currentMidnight)
            player:setCharVar("[DailyQuest]Completed",0)
            player:setCharVar("[DailyQuest]Fishstix",0)
            player:setCharVar("[DailyQuest]Murdoc",0)
            player:setCharVar("[DailyQuest]Mistrix",0)
            player:setCharVar("[DailyQuest]Saltlik",0)
            player:setCharVar("[DailyQuest]Beetrix",0)
        end
    end

    local fishstix = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Fishstix",
        look = 490,
        x = -48.7539,
        y = 0.000,
        z = -63.0204,
        rotation = 213,
        widescan = 1,

        onTrade = function(player, npc, trade)
            player:PrintToPlayer("I don't require any items from you.", 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
            handleMidnight(player)
            local questStage = player:getCharVar("[DailyQuest]Fishstix")
            local completedDailyQuests = player:getCharVar("[DailyQuest]Completed")
            
            -- handle quest stages
            if questStage == 0 then
                local randNum = math.random(1,101)
                local questZoneName = questLocations[randNum][1]
                player:setCharVar("[DailyQuest]Fishstix",1)
                player:setCharVar("[DailyQuest]Fishstix_zone",randNum)
                player:PrintToPlayer(string.format("Go to %s, find and open my Secret Treasure Chest!",questZoneName), 0, npc:getPacketName())
                return
            elseif questStage == 1 then
                local questZone = player:getCharVar("[DailyQuest]Fishstix_zone")
                local questZoneName = questLocations[questZone][1]
                player:PrintToPlayer(string.format("Go to %s, find and open my Secret Treasure Chest!",questZoneName), 0, npc:getPacketName())
                return
            elseif questStage == 2 then
                player:setCharVar("[DailyQuest]Fishstix",3)
                player:setCharVar("[DailyQuest]Completed",completedDailyQuests + 1)
                player:PrintToPlayer("Congratulations! You've completed my quest for today, here's your reward!", 0, npc:getPacketName())
                player:addCurrency('bayld', 1)
                player:PrintToPlayer("You have obtained 1 bayld!", 17)
                return
            elseif questStage == 3 then
                player:PrintToPlayer("You've already completed this quest today! Come back tomorrow for more.", 0, npc:getPacketName())
                return
            end
        end,
    })

    utils.unused(fishstix)

end)

return m
