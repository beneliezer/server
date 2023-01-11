-----------------------------------
-- Daily Quest : Murdoc
-- Kill 'x' amount of 'y' types of mobs in a certain zone
-----------------------------------
require("modules/module_utils")
require("scripts/globals/zone")
require("scripts/zones/Lower_Jeuno/Zone")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("daily_quest_murdoc")

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)

    local questLocations =
    {
        -- [index] | Zone Name | Mob Types
        [1] = {"West Ronfaure",             {"Rabbits","Worms","Bats","Crabs","Beetles","Orcs","Goblins","Sheep","Funguar"}},
        [2] = {"East Ronfaure",             {"Rabbits","Worms","Bats","Pugils","Beetles","Orcs","Goblins","Sheep","Funguar"}},
        [3] = {"South Gustaberg",           {"Worms","Bees","Bats","Crabs","Birds","Saplings","Lizards","Sheep","Goblins","Quadav"}},
        [4] = {"North Gustaberg",           {"Worms","Bees","Bats","Crabs","Birds","Saplings","Lizards","Pugils","Sheep","Goblins","Quadav"}},
        [5] = {"West Sarutabaruta",         {"Bees","Mandragora","Crabs","Rabbits","Birds","Goblins","Yagudo"}},
        [6] = {"East Sarutabaruta",         {"Bees","Mandragora","Crabs","Rabbits","Birds","Pugils","Goblins","Yagudo"}},
        [7] = {"La Theine Plateau",         {"Bats","Rabbits","Saplings","Worms","Crabs","Pugils","Bees","Funguars","Goblins","Orcs"}},
        [8] = {"Konschtat Highlands",       {"Saplings","Lizards","Bees","Sheep","Worms","Goblins","Quadav"}},
        [9] = {"Tahrongi Canyon",           {"Rabbits","Saplings","Mandragora","Yagudo","Goblins","Bees","Crawlers","Dhalmel"}},
        [10] = {"Valkurm Dunes",            {"Bats","Crabs","Rabbits","Lizards","Pugils","Goblins","Sheep","Flies","Leeches"}},
        [11] = {"Jugner Forest",            {"Evil Weapons","Sheep","Leeches","Tigers","Goblins","Funguars","Orcs","Pugils","Birds","Crabs","Saplings"}},
        [12] = {"Batallia Downs",           {"Crabs","Saplings","Flies","Birds","Goblins","Orcs","Tigers","Hounds"}},
        [13] = {"Pashhow Marshlands",       {"Rabbits","Bats","Bees","Goblins","Quadav","Pugils","Crabs","Flies","Hounds","Leeches","Crawlers","Funguars","Goobbues","Morbols"}},
        [14] = {"Rolanberry Fields",        {"Bats","Crabs","Bees","Leeches","Quadav","Goblins","Crawlers","Goobbues","Morbols"}},
        [15] = {"Sauromugue Champaign",     {"Bats","Lizards","Beetles","Goblins","Yagudo","Raptors","Cockatrice","Coeurls","Evil Weapons"}},
        [16] = {"Beaucedine Glacier",       {"Tigers","Goblins","Dolls","Ahriman","Golems","Gigas"}},
        [17] = {"Xarcabard",                {"Skeletons","Evil Weapons","Ghosts","Gigas","Ahriman","Demons"}},
        [18] = {"Cape Teriggan",            {"Rabbits","Goblins","Manticores","Crabs","Cockatrice","Lizards","Raptors","Pugils"}},
        [19] = {"Eastern Altepa Desert",    {"Spiders","Antica","Beetles","Worms","Dhalmel","Sabotenders","Scorpions","Goblins","Manticores","Rocs"}},
        [20] = {"Western Altepa Desert",    {"Antica","Sabotenders","Beetles","Dhalmel","Manticores","Spiders","Worms","Scorpions","Rocs"}},
        [21] = {"Meriphataud Mountains",    {"Bats","Saplings","Birds","Yagudo","Goblins","Flies","Lizards","Beetles","Raptors","Coeurls","Evil Weapons","Cockatrice"}},
        [22] = {"Buburimu Peninsula",       {"Rabbits","Mandragora","Goblins","Crabs","Crawlers","Birds","Dhalmel","Leeches","Pugils"}},
        [23] = {"The Sanctuary of Zi'Tah",  {"Bats","Goblins","Goobbues","Flies","Funguars","Leeches","Coeurls","Golems"}},
        [24] = {"Ro'Maeve",                 {"Evil Weapons","Dolls","Golems","Magic Pots"}},
        [25] = {"Yuhtunga Jungle",          {"Bees","Sahagin","Goblins","Lizards","Pugils","Crawlers","Opo-opo","Mandragora"}},
        [26] = {"Yhoator Jungle",           {"Morbols","Pugils","Goblins","Coeurls","Tonberries","Lizards","Crawlers","Opo-opo","Mandragora","Bees"}},
        [27] = {"Qufim Island",             {"Goblins","Gigas","Bats","Worms","Pugils","Crabs","Evil Weapons","Leeches"}},
        [28] = {"Temple of Uggalepih",      {"Magic Pots","Dolls","Crawlers","Bees","Opo-opo","Tonberries","Coeurls"}},
        [29] = {"Valley of Sorrows",        {"Rocs","Manticores","Raptors"}},
        [30] = {"Bibiki Bay",               {"Dhalmel","Efts","Goblins","Rabbits","Crabs","Birds","Mandragora","Uragnites","Opo-opo","Slimes"}},
        [31] = {"Carpenter's Landing",      {"Flytraps","Beetles","Tigers","Pugils","Funguars","Orcs","Bees"}},
        [32] = {"Uleguerand Range",         {"Rabbits","Worms","Snolls","Tigers","Buffalo","Bats","Raptors","Hecteyes","Tauri","Ahriman","Demons"}},
        [33] = {"Attohwa Chasm",            {"Coeurls","Lizards","Antlions","Scorpions","Worms","Flies","Goblins","Hecteyes"}},
        [34] = {"Oldton Movalpolos",        {"Bugbears","Bats","Goblins","Moblins"}},
        [35] = {"Newton Movalpolos",        {"Bugbears","Moblins","Bats"}},
        [36] = {"Wajaom Woodlands",         {"Spiders","Morbols","Treants","Fomors","Colibri","Mamool Ja","Marids","Puks","Leeches","Bees","Tigers","Saplings"}},
        [37] = {"Bhaflau Thickets",         {"Spiders","Colibri","Fomors","Mamool Ja","Marids","Treants","Puks","Saplings","Trolls","Tigers","Wivre"}},
        [38] = {"Arrapago Reef",            {"Apkallu","Leeches","Skeletons","Fomors","Doomed","Lamiae","Qutrub","Crabs","Sea Monks","Ghosts","Bats","Soulflayers"}},
        [39] = {"Mount Zhayolm",            {}},
        [40] = {"Halvung",                  {}},
        [41] = {"Mamook",                   {}},
        [42] = {"Aydeewa Subterrane",       {}},
        [43] = {"Alzadaal Undersea Ruins",  {}},
        [44] = {"Caedarva Mire",            {}},
        [45] = {"Yughott Grotto",           {}},
        [46] = {"Fort Ghelsba",             {}},
        [47] = {"Palborough Mines",         {}},
        [48] = {"Giddeus",                  {}},
        [49] = {"Beadeaux",                 {}},
        [50] = {"Davoi",                    {}},
        [51] = {"Monastic Cavern",          {}},
        [52] = {"Castle Oztroja",           {}},
        [53] = {"The Boyahda Tree",         {}},
        [54] = {"Lower Delkfutt's Tower",   {}},
        [55] = {"Middle Delkfutt's Tower",  {}},
        [56] = {"Upper Delkfutt's Tower",   {}},
        [57] = {"Den of Rancor",            {}},
        [58] = {"Castle Zvahl Baileys",     {}},
        [59] = {"Castle Zvahl Keep",        {}},
        [60] = {"Ranguemont Pass",          {}},
        [61] = {"Bostaunieux Oubliette",    {}},
        [62] = {"Toraimarai Canal",         {}},
        [63] = {"Zeruhn Mines",             {}},
        [64] = {"Korroloka Tunnel",         {}},
        [65] = {"Kuftal Tunnel",            {}},
        [66] = {"The Eldieme Necropolis",   {}},
        [67] = {"Sea Serpent Grotto",       {}},
        [68] = {"Dangruf Wadi",             {}},
        [69] = {"Inner Horutoto Ruins",     {}},
        [70] = {"Outer Horutoto Ruins",     {}},
        [71] = {"Ordelle's Caves",          {}},
        [72] = {"Gusgen Mines",             {}},
        [73] = {"Crawler's Nest",           {}},
        [74] = {"Maze of Shakhrami",        {}},
        [75] = {"Garlaige Citadel",         {}},
        [76] = {"Fei'Yin",                  {}},
        [77] = {"Ifrit's Cauldron",         {}},
        [78] = {"Quicksand Caves",          {}},
        [79] = {"Gustav Tunnel",            {}},
        [80] = {"Labyrinth of Onzozo",      {}},
        [81] = {"Dynamis - Bastok",         {}},
        [82] = {"Dynamis - San d'Oria",     {}},
        [83] = {"Dynamis - Windurst",       {}},
        [84] = {"Dynamis - Jeuno",          {}},
        [85] = {"Dynamis - Beaucedine",     {}},
        [86] = {"Dynamis - Xarcabard",      {}},
        [87] = {"Ru'Aun Gardens",           {}},
        [88] = {"Ve'Lugannon Palace",       {}},
        [89] = {"The Shrine of Ru'Avitau",  {}},
        [90] = {"Al'Taieu",                 {}},
        [91] = {"Grand Palace of Hu'Xzoi",  {}},
        [92] = {"The Garden of Ru'Hmet",    {}},
        [93] = {"Lufaise Meadows",          {}},
        [94] = {"Misareaux Coast",          {}},
        [95] = {"Phomiuna Aqueducts",       {}},
        [96] = {"Sacrarium",                {}},
        [97] = {"Riverne Site-A01",         {}},
        [98] = {"Riverne Site-B01",         {}},
        [99] = {"Escha - Zi'Tah",           {}},
        [100] = {"Escha - Ru'Aun",          {}}
    }

    local handleMidnight = function(player)
        local questMidnight = player:getCharVar("[DailyQuest]Midnight")
        local currentMidnight = getMidnight()

        -- handle first time quest midnight
        if questMidnight == 0 then
            player:setCharVar("[DailyQuest]Midnight", currentMidnight)
            player:setCharVar("[DailyQuest]Completed", 0)
            player:setCharVar("[DailyQuest]Fishstix", 0)
            player:setCharVar("[DailyQuest]Fishstix_zone", 0)
            player:setCharVar("[DailyQuest]Murdoc", 0)
            player:setCharVar("[DailyQuest]Murdoc_zone", 0)
            player:setCharVar("[DailyQuest]Murdoc_mobType", 0)
            player:setCharVar("[DailyQuest]Murdoc_killAmt", 0)
            player:setCharVar("[DailyQuest]Mistrix", 0)
            player:setCharVar("[DailyQuest]Mistrix_item", 0)
            player:setCharVar("[DailyQuest]Saltlik", 0)
            player:setCharVar("[DailyQuest]Saltlik_zone", 0)
            player:setCharVar("[DailyQuest]Saltlik_NM", 0)
            player:setCharVar("[DailyQuest]Beetrix", 0)
            player:setCharVar("[DailyQuest]Beetrix_zone", 0)
            player:setCharVar("[DailyQuest]Beetrix_RExItem", 0)
        end
        
        -- handle midnight reset
        if currentMidnight < questMidnight then
            player:setCharVar("[DailyQuest]Midnight", currentMidnight)
            player:setCharVar("[DailyQuest]Completed", 0)
            player:setCharVar("[DailyQuest]Fishstix", 0)
            player:setCharVar("[DailyQuest]Fishstix_zone", 0)
            player:setCharVar("[DailyQuest]Murdoc", 0)
            player:setCharVar("[DailyQuest]Murdoc_zone", 0)
            player:setCharVar("[DailyQuest]Murdoc_mobType", 0)
            player:setCharVar("[DailyQuest]Murdoc_killAmt", 0)
            player:setCharVar("[DailyQuest]Mistrix", 0)
            player:setCharVar("[DailyQuest]Mistrix_item", 0)
            player:setCharVar("[DailyQuest]Saltlik", 0)
            player:setCharVar("[DailyQuest]Saltlik_zone", 0)
            player:setCharVar("[DailyQuest]Saltlik_NM", 0)
            player:setCharVar("[DailyQuest]Beetrix", 0)
            player:setCharVar("[DailyQuest]Beetrix_zone", 0)
            player:setCharVar("[DailyQuest]Beetrix_RExItem", 0)
        end
    end

    local murdoc = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Murdoc",
        look = 491,
        x = -50.7539,
        y = 0.000,
        z = -61.6961,
        rotation = 213,
        widescan = 1,

        onTrade = function(player, npc, trade)
            player:PrintToPlayer("I don't require any items from you.", 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
            handleMidnight(player)
            local questStage = player:getCharVar("[DailyQuest]Murdoc")
            local completedDailyQuests = player:getCharVar("[DailyQuest]Completed")
            
            -- handle quest stages
            if questStage == 0 then
                local randNum = 1 -- force to West Ronfaure for testing
                --local randNum = math.random(1,100)
                local questZoneName = questLocations[randNum][1]
                local mobListLength = table.getn(questLocations[randNum][2])
                local randMobType = math.random(1,mobListLength)
                local questZoneMobTypeName = questLocations[randNum][2][randMobType]
                local randMobKillAmt = math.random(30,75)
                player:setCharVar("[DailyQuest]Murdoc",1)
                player:setCharVar("[DailyQuest]Murdoc_zone",randNum)
                player:setCharVar("[DailyQuest]Murdoc_mobType",randMobType)
                player:setCharVar("[DailyQuest]Murdoc_killAmt",randMobKillAmt)
                player:PrintToPlayer(string.format("Go to %s and kill %i %s!",questZoneName, randMobKillAmt, questZoneMobTypeName), 0, npc:getPacketName())
                return
            elseif questStage == 1 then
                local questZone = player:getCharVar("[DailyQuest]Murdoc_zone")
                local questZoneMobType = player:getCharVar("[DailyQuest]Murdoc_mobType")
                local questMobKillAmt = player:getCharVar("[DailyQuest]Murdoc_killAmt")
                local questZoneName = questLocations[questZone][1]
                local questZoneMobTypeName = questLocations[questZone][2][questZoneMobType]
                player:PrintToPlayer(string.format("Go to %s and kill %i %s!",questZoneName, questMobKillAmt, questZoneMobTypeName), 0, npc:getPacketName())
                return
            elseif questStage == 2 then
                player:setCharVar("[DailyQuest]Murdoc",3)
                player:setCharVar("[DailyQuest]Completed",completedDailyQuests + 1)
                player:PrintToPlayer("Congratulations! You've completed my quest for today, here's your reward!", 0, npc:getPacketName())
                player:addCurrency('bayld', 200)
                player:PrintToPlayer("You have obtained 200 bayld!", 17)
                return
            elseif questStage == 3 then
                player:PrintToPlayer("You've already completed this quest today! Come back tomorrow for more.", 0, npc:getPacketName())
                return
            end
        end,
    })

    utils.unused(murdoc)

    local killAmtMobs =
    {
        {1, 1, "West_Ronfaure", { "Wild_Rabbit",   "Forest_Hare"                                                                             } },
        {1, 2, "West_Ronfaure", { "Tunnel_Worm",   "Carrion_Worm"                                                                            } },
        {1, 3, "West_Ronfaure", { "Ding_Bats",     "Mouse_Bat"                                                                               } },
        {1, 4, "West_Ronfaure", { "River_Crab",    "Passage_Crab",    "Land_Crab",        "Limicoline_Crab", "Tree_Crab", "Vermivorous_Crab" } },
        {1, 5, "West_Ronfaure", { "Scarab_Beetle"                                                                                            } },
        {1, 6, "West_Ronfaure", { "Orcish_Fodder", "Orcish_Grappler", "Orcish_Mesmerizer"                                                    } },
        {1, 7, "West_Ronfaure", { "Goblin_Thug",   "Goblin_Weaver",   "Goblin_Digger",    "Goblin_Fisher"                                    } },
        {1, 8, "West_Ronfaure", { "Wild_Sheep"                                                                                               } },
        {1, 9, "West_Ronfaure", { "Forest_Funguar"                                                                                           } }
    }

    for _, entry in pairs(killAmtMobs) do
        local zoneNum        = entry[1]
        local mobTypeNum     = entry[2]
        local zoneName       = entry[3]
        local mobNamesLength = #(entry[4])

        for i = 1, mobNamesLength do
            local mobName = entry[4][i]

            --print( string.format("xi.zones.%s.mobs.%s.onMobDeath", zoneName, mobName) )

            m:addOverride(string.format("xi.zones.%s.mobs.%s.onMobDeath", zoneName, mobName), function(mob, player, optParams)
                super(mob, player, optParams)

                local dailyQuestActive = player:getCharVar("[DailyQuest]Murdoc")
                local dailyZone        = player:getCharVar("[DailyQuest]Murdoc_zone")
                local dailyMobType     = player:getCharVar("[DailyQuest]Murdoc_mobType")
                local dailyMobKillAmt  = player:getCharVar("[DailyQuest]Murdoc_killAmt")

                if
                    dailyQuestActive == 1 and
                    dailyZone == zoneNum and
                    dailyMobType == mobTypeNum
                then
                    if optParams.isKiller then
                        if dailyMobKillAmt > 1 then
                            player:setCharVar("[DailyQuest]Murdoc_killAmt",dailyMobKillAmt - 1)
                        elseif dailyMobKillAmt == 1 then
                            player:setCharVar("[DailyQuest]Murdoc_killAmt",dailyMobKillAmt - 1)
                            player:setCharVar("[DailyQuest]Murdoc",2)
                            player:PrintToPlayer( string.format("You've killed enough %s's, please return to Murdoc to claim your reward!", mob:getName()), 17)
                        end
                    end
                end
            end)
        end
    end
end)

return m
