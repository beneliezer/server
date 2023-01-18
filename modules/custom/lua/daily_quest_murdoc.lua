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
        [  1] = {"West Ronfaure",            {"Bats", "Beetles", "Crabs", "Funguar", "Goblins", "Orcs", "Rabbits", "Sheep", "Worms"}},
        [  2] = {"East Ronfaure",            {"Bats", "Beetles", "Funguar", "Goblins", "Orcs", "Pugils", "Rabbits", "Sheep", "Worms"}},
        [  3] = {"South Gustaberg",          {"Bats", "Bees", "Birds", "Crabs", "Goblins", "Lizards", "Quadav", "Saplings", "Sheep", "Worms"}},
        [  4] = {"North Gustaberg",          {"Bats", "Bees", "Birds", "Crabs", "Goblins", "Lizards", "Pugils", "Quadav", "Saplings", "Sheep", "Worms"}},
        [  5] = {"West Sarutabaruta",        {"Bees", "Birds", "Crabs", "Goblins", "Mandragora", "Rabbits", "Yagudo"}},
        [  6] = {"East Sarutabaruta",        {"Bees", "Birds", "Crabs", "Goblins", "Mandragora", "Pugils", "Rabbits", "Yagudo"}},
        [  7] = {"La Theine Plateau",        {"Bats", "Bees", "Crabs", "Funguars", "Goblins", "Orcs", "Pugils", "Rabbits", "Saplings", "Worms"}},
        [  8] = {"Konschtat Highlands",      {"Bees", "Goblins", "Lizards", "Quadav", "Saplings", "Sheep", "Worms"}},
        [  9] = {"Tahrongi Canyon",          {"Bees", "Crawlers", "Dhalmel", "Goblins", "Mandragora", "Rabbits", "Saplings", "Yagudo"}},
        [ 10] = {"Valkurm Dunes",            {"Bats", "Crabs", "Flies", "Goblins", "Leeches", "Lizards", "Pugils", "Rabbits", "Sheep"}},
        [ 11] = {"Jugner Forest",            {"Birds", "Crabs", "Evil Weapons", "Funguars", "Goblins", "Leeches", "Orcs", "Pugils", "Saplings", "Sheep", "Tigers"}},
        [ 12] = {"Batallia Downs",           {"Birds", "Crabs", "Flies", "Goblins", "Hounds", "Orcs", "Saplings", "Tigers"}},
        [ 13] = {"Pashhow Marshlands",       {"Bats", "Bees", "Crabs", "Crawlers", "Flies", "Funguars", "Goblins", "Goobbues", "Hounds", "Leeches", "Morbols", "Pugils", "Quadav", "Rabbits"}},
        [ 14] = {"Rolanberry Fields",        {"Bats", "Bees", "Crabs", "Crawlers", "Goblins", "Goobbues", "Leeches", "Morbols", "Quadav"}},
        [ 15] = {"Sauromugue Champaign",     {"Bats", "Beetles", "Cockatrice", "Coeurls", "Evil Weapons", "Goblins", "Lizards", "Raptors", "Yagudo"}},
        [ 16] = {"Beaucedine Glacier",       {"Ahriman", "Dolls", "Gigas", "Goblins", "Golems", "Tigers"}},
        [ 17] = {"Xarcabard",                {"Ahriman", "Demons", "Evil Weapons", "Ghosts", "Gigas", "Skeletons"}},
        [ 18] = {"Cape Teriggan",            {"Cockatrice", "Crabs", "Goblins", "Lizards", "Manticores", "Pugils", "Rabbits", "Raptors"}},
        [ 19] = {"Eastern Altepa Desert",    {"Antica", "Beetles", "Dhalmel", "Goblins", "Manticores", "Rocs", "Sabotenders", "Scorpions", "Spiders", "Worms"}},
        [ 20] = {"Western Altepa Desert",    {"Antica", "Beetles", "Dhalmel", "Manticores", "Rocs", "Sabotenders", "Scorpions", "Spiders", "Worms"}},
        [ 21] = {"Meriphataud Mountains",    {"Bats", "Birds", "Beetles", "Cockatrice", "Coeurls", "Evil Weapons", "Flies", "Goblins", "Lizards", "Raptors", "Saplings", "Yagudo"}},
        [ 22] = {"Buburimu Peninsula",       {"Birds", "Crabs", "Crawlers", "Dhalmel", "Goblins", "Leeches", "Mandragora", "Pugils", "Rabbits"}},
        [ 23] = {"The Sanctuary of Zi'Tah",  {"Bats", "Coeurls", "Flies", "Funguars", "Goblins", "Golems", "Goobbues", "Leeches"}},
        [ 24] = {"Ro'Maeve",                 {"Dolls", "Evil Weapons", "Golems", "Magic Pots"}},
        [ 25] = {"Yuhtunga Jungle",          {"Bees", "Crawlers", "Goblins", "Lizards", "Mandragora", "Opo-opo", "Pugils", "Sahagin"}},
        [ 26] = {"Yhoator Jungle",           {"Bees", "Coeurls", "Crawlers", "Goblins", "Lizards", "Mandragora", "Morbols", "Opo-opo", "Pugils", "Tonberries"}},
        [ 27] = {"Qufim Island",             {"Bats", "Crabs", "Evil Weapons", "Gigas", "Goblins", "Leeches", "Pugils", "Worms"}},
        [ 28] = {"Temple of Uggalepih",      {"Bees", "Coeurls", "Crawlers", "Dolls", "Magic Pots", "Opo-opo", "Tonberries"}},
        [ 29] = {"Valley of Sorrows",        {"Manticores", "Raptors", "Rocs"}},
        [ 30] = {"Bibiki Bay",               {"Birds", "Crabs", "Dhalmel", "Efts", "Goblins", "Mandragora", "Opo-opo", "Rabbits", "Slimes", "Uragnites"}},
        [ 31] = {"Carpenter's Landing",      {"Beetles", "Bees", "Flytraps", "Funguars", "Orcs", "Pugils", "Tigers"}},
        [ 32] = {"Uleguerand Range",         {"Ahriman", "Bats", "Buffalo", "Demons", "Hecteyes", "Rabbits", "Raptors", "Snolls", "Tauri", "Tigers", "Worms"}},
        [ 33] = {"Attohwa Chasm",            {"Antlions", "Coeurls", "Flies", "Goblins", "Hecteyes", "Lizards", "Scorpions", "Worms"}},
        [ 34] = {"Oldton Movalpolos",        {"Bats", "Bugbears", "Goblins", "Moblins"}},
        [ 35] = {"Newton Movalpolos",        {"Bats", "Bugbears", "Moblins"}},
        [ 36] = {"Wajaom Woodlands",         {"Bees", "Colibri", "Fomors", "Leeches", "Mamool Ja", "Marids", "Morbols", "Puks", "Saplings", "Spiders", "Tigers", "Treants"}},
        [ 37] = {"Bhaflau Thickets",         {"Colibri", "Fomors", "Mamool Ja", "Marids", "Puks", "Saplings", "Spiders", "Tigers", "Trolls", "Treants", "Wivre"}},
        [ 38] = {"Arrapago Reef",            {"Apkallu", "Bats", "Crabs", "Doomed", "Fomors", "Ghosts", "Lamiae", "Leeches", "Qutrub", "Sea Monks", "Skeletons", "Soulflayers"}},
        [ 39] = {"Mount Zhayolm",            {"Apkallu", "Crabs", "Crawlers", "Flans", "Fly", "Ghosts", "Pugil", "Slime", "Troll", "Wamoura"}},
        [ 40] = {"Halvung",                  {"Bombs", "Crawlers", "Flans", "Scorpions", "Trolls", "Wamouracampa"}},
        [ 41] = {"Mamook",                   {"Cockatrice", "Colibri", "Lizards", "Mamool Ja", "Pugils", "Puks", "Raptors", "Spiders"}},
        [ 42] = {"Aydeewa Subterrane",       {"Chigoes", "Crawlers", "Diremites", "Flytraps", "Leeches", "Qiqirn", "Saplings", "Slimes", "Tigers", "Worms"}},
        [ 43] = {"Alzadaal Undersea Ruins",  {"Qiqirn", "Gears"}},
        [ 44] = {"Caedarva Mire",            {"Birds", "Chigoes", "Doomed", "Flies", "Imps", "Leeches", "Qutrub", "Saplings", "Soulflayers"}},
        [ 45] = {"Yughott Grotto",           {"Bats", "Orcs"}},
        [ 46] = {"Fort Ghelsba",             {"Lizards", "Orcish Warmachines", "Orcs"}},
        [ 47] = {"Palborough Mines",         {"Beetles", "Funguars", "Quadav", "Rabbits"}},
        [ 48] = {"Giddeus",                  {"Bees", "Pugils", "Worms", "Yagudo"}},
        [ 49] = {"Beadeaux",                 {"Crawlers", "Pugils", "Quadav", "Sheep"}},
        [ 50] = {"Davoi",                    {"Bees", "Bats", "Lizards", "Orcs", "Pugils"}},
        [ 51] = {"Monastic Cavern",          {"Orcs"}},
        [ 52] = {"Castle Oztroja",           {"Bats", "Yagudo"}},
        [ 53] = {"The Boyahda Tree",         {"Crabs", "Crawlers", "Flies", "Funguars", "Goobbues", "Mandragora", "Rabbits", "Spiders"}},
        [ 54] = {"Lower Delkfutt's Tower",   {"Bats", "Gigas", "Goblins"}},
        [ 55] = {"Middle Delkfutt's Tower",  {"Bats","Gigas", "Goblins"}},
        [ 56] = {"Upper Delkfutt's Tower",   {"Bats", "Gigas"}},
        [ 57] = {"Den of Rancor",            {"Bats", "Hecteyes", "Slimes", "Mandragora", "Tonberries", "Lizards"}},
        [ 58] = {"Castle Zvahl Baileys",     {"Ahriman", "Demons", "Goblins", "Orcs", "Quadav", "Yagudo"}},
        [ 59] = {"Castle Zvahl Keep",        {"Ahriman", "Demons", "Goblins", "Orcs", "Quadav", "Yagudo"}},
        [ 60] = {"Ranguemont Pass",          {"Bats", "Goblins", "Hecteyes"}},
        [ 61] = {"Bostaunieux Oubliette",    {"Bats", "Hounds", "Leeches", "Slimes"}},
        [ 62] = {"Toraimarai Canal",         {"Bats", "Crabs", "Leeches", "Pugils", "Skeletons"}},
        [ 63] = {"Zeruhn Mines",             {"Bats", "Crabs", "Worms"}},
        [ 64] = {"Korroloka Tunnel",         {"Bats", "Crabs", "Gigas", "Goblins", "Leeches", "Pugils", "Spiders", "Worms"}},
        [ 65] = {"Kuftal Tunnel",            {"Crabs", "Goblins", "Lizards", "Raptors", "Sabotenders", "Spiders", "Tigers", "Worms"}},
        [ 66] = {"The Eldieme Necropolis",   {"Ghosts", "Hounds", "Shadows", "Skeletons"}},
        [ 67] = {"Sea Serpent Grotto",       {"Bats", "Crabs", "Leeches", "Pugils", "Sahagin", "Sea Monks", "Skeletons"}},
        [ 68] = {"Dangruf Wadi",             {"Crabs", "Goblins", "Leeches", "Lizards", "Opo-opo", "Rabbits", "Worms"}},
        [ 69] = {"Inner Horutoto Ruins",     {"Bats", "Evil Weapons", "Goblins", "Skeletons"}},
        [ 70] = {"Outer Horutoto Ruins",     {"Bats", "Cardians", "Goblins"}},
        [ 71] = {"Ordelle's Caves",          {"Bats", "Beetles", "Funguars", "Goblins", "Leeches", "Rabbits", "Saplings"}},
        [ 72] = {"Gusgen Mines",             {"Flies", "Funguars", "Ghosts", "Hounds", "Skeletons", "Worms"}},
        [ 73] = {"Crawler's Nest",           {"Bees", "Beetles", "Crawlers", "Flies", "Funguars", "Lizards", "Saplings"}},
        [ 74] = {"Maze of Shakhrami",        {"Bats", "Crawlers", "Goblins", "Leeches", "Scorpions", "Skeletons", "Worms"}},
        [ 75] = {"Garlaige Citadel",         {"Bats", "Beetles", "Bombs", "Evil Weapons", "Ghosts", "Magic Pots", "Skeletons"}},
        [ 76] = {"Fei'Yin",                  {"Bats", "Dolls", "Ghosts", "Magic Pots", "Shadows"}},
        [ 77] = {"Ifrit's Cauldron",         {"Bats", "Bombs", "Goblins", "Opo-opo", "Raptors"}},
        [ 78] = {"Quicksand Caves",          {"Antica", "Beetles", "Lizards", "Sabotenders", "Spiders", "Worms"}},
        [ 79] = {"Gustav Tunnel",            {"Crabs", "Flies", "Goblins", "Pugils", "Skeletons", "Worms"}},
        [ 80] = {"Labyrinth of Onzozo",      {"Cockatrice", "Coeurls", "Goblins", "Scorpions", "Sea Monks"}},
        [ 81] = {"Dynamis - Bastok",         {"Quadav"}},
        [ 82] = {"Dynamis - San d'Oria",     {"Orc"}},
        [ 83] = {"Dynamis - Windurst",       {"Yagudo"}},
        [ 84] = {"Dynamis - Jeuno",          {"Goblin"}},
        [ 85] = {"Dynamis - Beaucedine",     {"Goblin", "Hydra", "Orc", "Quadav", "Yagudo"}},
        [ 86] = {"Dynamis - Xarcabard",      {"Demon"}},
        [ 87] = {"Ru'Aun Gardens",           {"Birds", "Dolls", "Magic Pots"}},
        [ 88] = {"Ve'Lugannon Palace",       {"Evil Weapons", "Golems", "Magic Pots", "Spheroids"}},
        [ 89] = {"The Shrine of Ru'Avitau",  {"Dolls", "Evil Weapons", "Golems", "Magic Pots", "Spheroids"}},
        [ 90] = {"Al'Taieu",                 {"Aern", "Hpemde", "Phuabo", "Xzomit"}},
        [ 91] = {"Grand Palace of Hu'Xzoi",  {"Aern", "Euvhi", "Ghrah", "Zdei"}},
        [ 92] = {"The Garden of Ru'Hmet",    {"Aern", "Euvhi", "Ghrah", "Zdei"}},
        [ 93] = {"Lufaise Meadows",          {"Bees", "Bugards", "Fomors", "Gigas", "Orcs", "Rocs", "Sheep"}},
        [ 94] = {"Misareaux Coast",          {"Bees", "Bugards", "Fomors", "Gigas", "Orcs", "Pugils", "Sheep"}},
        [ 95] = {"Phomiuna Aqueducts",       {"Diremites", "Fomors", "Pugils", "Spiders", "Tauri"}},
        [ 96] = {"Sacrarium",                {"Fomors", "Skeletons", "Spiders", "Tauri"}},
        [ 97] = {"Riverne Site-A01",         {"Birds", "Clusters", "Flies", "Flytraps", "Hippogryphs", "Wyverns"}},
        [ 98] = {"Riverne Site-B01",         {"Clusters", "Hippogryphs", "Morbols", "Rocs", "Wyverns"}},
        [ 99] = {"Escha - Zi'Tah",           {"Bees", "Bugards", "Coeurls", "Corses", "Crawlers", "Dhalmels", "Dragons", "Efts", "Opo-opo", "Puks"}},
        [100] = {"Escha - Ru'Aun",           {"Aern", "Gargouilles", "Ghrah", "Phuabo", "Porxies", "Xzomit", "ovra", "Zdei"}}
    }

    local handleMidnight = function(player)
        local questMidnight = player:getCharVar("[DQ]Midnight")
        local currentMidnight = getMidnight()

        -- handle first time quest midnight
        if questMidnight == 0 then
            player:setCharVar("[DQ]Midnight", currentMidnight)
            player:setCharVar("[DQ]Completed", 0)
            player:setCharVar("[DQ]Fishstix", 0)
            player:setCharVar("[DQ]Fishstix_Z", 0)
            player:setCharVar("[DQ]Murdoc", 0)
            player:setCharVar("[DQ]Murdoc_Z", 0)
            player:setCharVar("[DQ]Murdoc_MT", 0)
            player:setCharVar("[DQ]Murdoc_KA", 0)
            player:setCharVar("[DQ]Mistrix", 0)
            player:setCharVar("[DQ]Mistrix_I", 0)
            player:setCharVar("[DQ]Saltlik", 0)
            player:setCharVar("[DQ]Saltlik_Z", 0)
            player:setCharVar("[DQ]Saltlik_NM", 0)
            player:setCharVar("[DQ]Beetrix", 0)
            player:setCharVar("[DQ]Beetrix_Z", 0)
            player:setCharVar("[DQ]Beetrix_RE", 0)
        end
        
        -- handle midnight reset
        if currentMidnight < questMidnight then
            player:setCharVar("[DQ]Midnight", currentMidnight)
            player:setCharVar("[DQ]Completed", 0)
            player:setCharVar("[DQ]Fishstix", 0)
            player:setCharVar("[DQ]Fishstix_Z", 0)
            player:setCharVar("[DQ]Murdoc", 0)
            player:setCharVar("[DQ]Murdoc_Z", 0)
            player:setCharVar("[DQ]Murdoc_MT", 0)
            player:setCharVar("[DQ]Murdoc_KA", 0)
            player:setCharVar("[DQ]Mistrix", 0)
            player:setCharVar("[DQ]Mistrix_I", 0)
            player:setCharVar("[DQ]Saltlik", 0)
            player:setCharVar("[DQ]Saltlik_Z", 0)
            player:setCharVar("[DQ]Saltlik_NM", 0)
            player:setCharVar("[DQ]Beetrix", 0)
            player:setCharVar("[DQ]Beetrix_Z", 0)
            player:setCharVar("[DQ]Beetrix_RE", 0)
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
            local questStage = player:getCharVar("[DQ]Murdoc")
            local completedDailyQuests = player:getCharVar("[DQ]Completed")
            
            -- handle quest stages
            if questStage == 0 then
                local randNum = 1 -- force to West Ronfaure for testing
                --local randNum = math.random(1,100)
                local questZoneName = questLocations[randNum][1]
                local mobListLength = table.getn(questLocations[randNum][2])
                local randMobType = math.random(1,mobListLength)
                local questZoneMobTypeName = questLocations[randNum][2][randMobType]
                local randMobKillAmt = math.random(30,75)
                player:setCharVar("[DQ]Murdoc",1)
                player:setCharVar("[DQ]Murdoc_Z",randNum)
                player:setCharVar("[DQ]Murdoc_MT",randMobType)
                player:setCharVar("[DQ]Murdoc_KA",randMobKillAmt)
                player:PrintToPlayer(string.format("Go to %s and kill %i %s!",questZoneName, randMobKillAmt, questZoneMobTypeName), 0, npc:getPacketName())
                return
            elseif questStage == 1 then
                local questZone = player:getCharVar("[DQ]Murdoc_Z")
                local questZoneMobType = player:getCharVar("[DQ]Murdoc_MT")
                local questMobKillAmt = player:getCharVar("[DQ]Murdoc_KA")
                local questZoneName = questLocations[questZone][1]
                local questZoneMobTypeName = questLocations[questZone][2][questZoneMobType]
                player:PrintToPlayer(string.format("Go to %s and kill %i %s!",questZoneName, questMobKillAmt, questZoneMobTypeName), 0, npc:getPacketName())
                return
            elseif questStage == 2 then
                player:setCharVar("[DQ]Murdoc",3)
                player:setCharVar("[DQ]Completed",completedDailyQuests + 1)
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

end)

local killAmtMobs =
{
    -- West Ronfaure( /scripts/zones/West_Ronfaure/mobs )
    -- LUA'S COMPLETED:
	{1, 1, "West_Ronfaure", { "Ding_Bats", "Mouse_Bat"                                                                                      } },
	{1, 2, "West_Ronfaure", { "Scarab_Beetle"                                                                                               } },
	{1, 3, "West_Ronfaure", { "River_Crab", "Passage_Crab", "Land_Crab", "Limicoline_Crab", "Tree_Crab", "Vermivorous_Crab"                 } },
	{1, 4, "West_Ronfaure", { "Forest_Funguar"                                                                                              } },
	{1, 5, "West_Ronfaure", { "Goblin_Thug", "Goblin_Weaver", "Goblin_Digger", "Goblin_Fisher"                                              } },
	{1, 6, "West_Ronfaure", { "Orcish_Fodder", "Orcish_Grappler", "Orcish_Mesmerizer"                                                       } },
	{1, 7, "West_Ronfaure", { "Wild_Rabbit", "Forest_Hare"                                                                                  } },
	{1, 8, "West_Ronfaure", { "Wild_Sheep"                                                                                                  } },
	{1, 9, "West_Ronfaure", { "Tunnel_Worm", "Carrion_Worm"                                                                                 } },

    -- East Ronfaure( /scripts/zones/East_Ronfaure/mobs )
    -- LUA'S COMPLETED:
	{2, 1, "East_Ronfaure", { "Ding_Bats", "Mouse_Bat"                                                                                      } },
	{2, 2, "East_Ronfaure", { "Scarab_Beetle"                                                                                               } },
	{2, 3, "East_Ronfaure", { "Forest_Funguar"                                                                                              } },
	{2, 4, "East_Ronfaure", { "Goblin_Thug", "Goblin_Weaver", "Goblin_Digger", "Goblin_Fisher"                                              } },
	{2, 5, "East_Ronfaure", { "Orcish_Fodder", "Orcish_Grappler", "Orcish_Mesmerizer"                                                       } },
	{2, 6, "East_Ronfaure", { "Cheval_Pugil", "Fighting_Pugil", "Mud_Pugil", "Pug_Pugil", "Pugil"                                           } },
	{2, 7, "East_Ronfaure", { "Wild_Rabbit", "Forest_Hare"                                                                                  } },
	{2, 8, "East_Ronfaure", { "Wild_Sheep"                                                                                                  } },
	{2, 9, "East_Ronfaure", { "Tunnel_Worm", "Carrion_Worm"                                                                                 } },

    -- South Gustaberg( /scripts/zones/South_Gustaberg/mobs )
    -- LUA'S COMPLETED:
	{3,  1, "South_Gustaberg", { "Ding_Bats"                                                                                                } },
	{3,  2, "South_Gustaberg", { "Huge_Hornet", "Maneating_Hornet"                                                                          } },
	{3,  3, "South_Gustaberg", { "Vulture"                                                                                                  } },
	{3,  4, "South_Gustaberg", { "Stone_Crab", "Sand_Crab", "Land_Crab", "Mole_Crab", "Passage_Crab"                                        } },
	{3,  5, "South_Gustaberg", { "Goblin_Fisher", "Goblin_Thug", "Goblin_Weaver", "Goblin_Digger"                                           } },
	{3,  6, "South_Gustaberg", { "Rock_Lizard"                                                                                              } },
	{3,  7, "South_Gustaberg", { "Amber_Quadav", "Amethyst_Quadav", "Young Quadav"                                                          } },
	{3,  8, "South_Gustaberg", { "Walking_Sapling"                                                                                          } },
	{3,  9, "South_Gustaberg", { "Ornery_Sheep"                                                                                             } },
	{3, 10, "South_Gustaberg", { "Tunnel_Worm", "Stone_Eater"                                                                               } },

    -- North Gustaberg( /scripts/zones/North_Gustaberg/mobs )
    -- LUA'S COMPLETED:
	{4,  1, "North_Gustaberg", { "Ding_Bats", "Fledermaus"                                                                                  } },
	{4,  2, "North_Gustaberg", { "Huge_Hornet", "Maneating_Hornet"                                                                          } },
	{4,  3, "North_Gustaberg", { "Vulture"                                                                                                  } },
	{4,  4, "North_Gustaberg", { "Stone_Crab", "Sand_Crab", "River_Crab"                                                                    } },
	{4,  5, "North_Gustaberg", { "Goblin_Fisher", "Goblin_Thug", "Goblin_Weaver", "Goblin_Digger", "Goblin_Gambler", "Goblin_Leecher", "Goblin Mugger" } },
	{4,  6, "North_Gustaberg", { "Rock_Lizard"                                                                                              } },
	{4,  7, "North_Gustaberg", { "Sand_Pugil"                                                                                               } },
	{4,  8, "North_Gustaberg", { "Amber_Quadav", "Amethyst_Quadav", "Young_Quadav"                                                          } },
	{4,  9, "North_Gustaberg", { "Walking_Sapling"                                                                                          } },
	{4, 10, "North_Gustaberg", { "Ornery_Sheep"                                                                                             } },
	{4, 11, "North_Gustaberg", { "Tunnel Worm", "Stone Eater"                                                                               } },
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

            local dailyQuestActive = player:getCharVar("[DQ]Murdoc")
            local dailyZone        = player:getCharVar("[DQ]Murdoc_Z")
            local dailyMobType     = player:getCharVar("[DQ]Murdoc_MT")
            local dailyMobKillAmt  = player:getCharVar("[DQ]Murdoc_KA")

            if
                dailyQuestActive == 1 and
                dailyZone == zoneNum and
                dailyMobType == mobTypeNum
            then
                if optParams.isKiller then
                    if dailyMobKillAmt > 1 then
                        player:setCharVar("[DQ]Murdoc_KA",dailyMobKillAmt - 1)
                    elseif dailyMobKillAmt == 1 then
                        player:setCharVar("[DQ]Murdoc_KA",dailyMobKillAmt - 1)
                        player:setCharVar("[DQ]Murdoc",2)
                        player:PrintToPlayer( string.format("You've killed enough %s's, please return to Murdoc to claim your reward!", mob:getName()), 17)
                    end
                end
            end
        end)
    end
end

return m
