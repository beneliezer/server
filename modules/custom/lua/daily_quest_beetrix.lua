-----------------------------------
-- Daily Quest : Beetrix
-- Turn in a certain 'R/Ex' item
-----------------------------------
require("modules/module_utils")
require("scripts/globals/zone")
require("scripts/zones/Lower_Jeuno/Zone")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("daily_quest_beetrix")

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)

    local questLocations =
    {
        -- [index] | Zone Name | R/Ex | R/Ex Item ID
        [1] = {"West Ronfaure",             {"Clipeus","Blind Ring","Evolith"},                                                                 {12371,15834,2783}},
        [2] = {"East Ronfaure",             {"Surviver","Gelong Staff"},                                                                        {19157,17594}},
        [3] = {"South Gustaberg",           {"Katayama Ichimonji","Bronze Bandolier","Evolith"},                                                {17811,15926,2783}},
        [4] = {"North Gustaberg",           {"Optical Earring","Rambler's Cloak"},                                                              {14803,11312}},
        [5] = {"West Sarutabaruta",         {"Pilgrim's Wand","Two-Leaf Mandragora Bud","Four-Leaf Mandragora Bud","Firefly"},                  {18394,4368,4369,19221}},
        [6] = {"East Sarutabaruta",         {"Entrancing Ribbon","Pile Chain","Two-Leaf Mandragora Bud","Muddy Bar Tab"},                       {15218,16279,4368,585}},
        [7] = {"La Theine Plateau",         {"Desperado Ring","Van Pendant","Lumbering Horn"},                                                  {15835,15503,910}},
        [8] = {"Konschtat Highlands",       {"Attar of Roses","Rampaging Horn"},                                                                {19223,911}},
        [9] = {"Tahrongi Canyon",           {"Protect Earring","Fasting Ring","Damp Envelope","Odd Postcard"},                                  {16007,15546,587,586}},
        [10] = {"Valkurm Dunes",            {"Phlegethon's Trousers","Crab Apron","Damselfly Worm"},                                            {16367,539,537}},
        [11] = {"Jugner Forest",            {"Pinwheel Belt","Garde Pick"},                                                                     {15927,17947}},
        [12] = {"Batallia Downs",           {"Mokusa","Engraved Key","Counterfeit Gil","Nyumomo Doll"},                                         {18451,535,1708,1706}},
        [13] = {"Pashhow Marshlands",       {"Wurger","Tortoise Shield","Seedspall Luna"},                                                      {19222,12374,2741}},
        [14] = {"Rolanberry Fields",        {"Rambler's Gaiters","Helenus's Earring","Naphille Pochette"},                                      {11401,16037,1709}},
        [15] = {"Sauromugue Champaign",     {"Herder's Subligar","Dodo Skin","Cassandra's Earring"},                                            {16368,1014,16038}},
        [16] = {"Beaucedine Glacier",       {"Haraldr's Mufflers","Boreas Cesti","Nue Fang"},                                                   {16280,18359,1012}},
        [17] = {"Xarcabard",                {"Gothic Gauntlets","Rover's Gloves","Jasper Tathlum"},                                             {15042,15056,19238}},
        [18] = {"Cape Teriggan",            {"Sirocco Axe","Sirocco Kukri","Fendoir"},                                                          {17965,18018,17969}},
        [19] = {"Eastern Altepa Desert",    {"Casaba Melon Tank","Intruder Earring"},                                                           {16251,14806}},
        [20] = {"Western Altepa Desert",    {"Galkan Dagger","Fuchingiri","Dhalmel Whistle","Thrakon Breastplate"},                             {19114,19278,15505,11343}},
        [21] = {"Meriphataud Mountains",    {"Mammut","Seedspall Astrum","Ajase Beads"},                                                        {18503,2742,15504}},
        [22] = {"Buburimu Peninsula",       {"Pestle","Wild Rabbit Tail","Yuhtunga Sulfur","Dhalmel Saliva"},                                   {18599,542,934,541}},
        [23] = {"The Sanctuary of Zi'Tah",  {"Rossignol","Rain Hat","Hound Fang Sack"},                                                         {18075,15220,1539}},
        [24] = {"Ro'Maeve",                 {"Diana Corona","Lyricist's Gonnelle"},                                                             {11486,11533}},
        [25] = {"Yuhtunga Jungle",          {"Buccaneer's Scimitar","Slick Dart","Vilma's Ring"},                                               {17760,19237,15547}},
        [26] = {"Yhoator Jungle",           {"Beluga","Echo Cape","Rancor Handle","Resentment Cape","Sarabande Earring"},                       {18953,11534,1487,15468,16034}},
        [27] = {"Qufim Island",             {"Custodes","Egret Fishing Rod"},                                                                   {18762,1726}},
        [28] = {"Temple of Uggalepih",      {"Boneworker's Torque","Hototogisu","Cursed Key","Hornetneedle","Charging Shield"},                 {10953,16899,1143,17980,12381}},
        [29] = {"Valley of Sorrows",        {"Daedalus Hammer","Sipar"},                                                                        {18867,12361}},
        [30] = {"Bibiki Bay",               {"Knack Pendant","Adoubeur's Pavise"},                                                              {16298,16187}},
        [31] = {"Carpenter's Landing",      {"Mycophile Cuffs"},                                                                                {14884}},
        [32] = {"Uleguerand Range",         {"Selene's Bow","Purgatory Collar","Pygme Sainti"},                                                 {17212,15507,18770}},
        [33] = {"Attohwa Chasm",            {"Archer's Jupon","Layqa Seraweels","Attohwa Ginseng"},                                             {14467,16374,1683}},
        [34] = {"Oldton Movalpolos",        {"Parade Gorget","Magicked Steel","Moblin Hotrok"},                                                 {15506,1696,1729}},
        [35] = {"Newton Movalpolos",        {"Rutter Sabatons","Sylvan Stone","Barbarian Mittens"},                                             {15349,1781,14889}},
        [36] = {"Wajaom Woodlands",         {"Tartaglia","Jody's Acid","Mamook Tanscale Key"},                                                  {17971,2307,2225}},
        [37] = {"Bhaflau Thickets",         {"Veuglaire","Tempest Belt","Mamook Blackscale Key"},                                               {19235,15946,2226}},
        [38] = {"Arrapago Reef",            {"Lyft Jambiya","Corsair's Scimitar","Mercenary's Turban","Evoker's Gages","Volunteer's Nails"},    {19125,17737,16083,14960,15710}},
        [39] = {"Mount Zhayolm",            {},{}},
        [40] = {"Halvung",                  {},{}},
        [41] = {"Mamook",                   {},{}},
        [42] = {"Aydeewa Subterrane",       {},{}},
        [43] = {"Alzadaal Undersea Ruins",  {},{}},
        [44] = {"Nyzul Isle",               {},{}},
        [45] = {"Caedarva Mire",            {},{}},
        [46] = {"Yughott Grotto",           {},{}},
        [47] = {"Fort Ghelsba",             {},{}},
        [48] = {"Palborough Mines",         {},{}},
        [49] = {"Giddeus",                  {},{}},
        [50] = {"Beadeaux",                 {},{}},
        [51] = {"Davoi",                    {},{}},
        [52] = {"Monastic Cavern",          {},{}},
        [53] = {"Castle Oztroja",           {},{}},
        [54] = {"The Boyahda Tree",         {},{}},
        [55] = {"Lower Delkfutt's Tower",   {},{}},
        [56] = {"Middle Delkfutt's Tower",  {},{}},
        [57] = {"Upper Delkfutt's Tower",   {},{}},
        [58] = {"Den of Rancor",            {},{}},
        [59] = {"Castle Zvahl Baileys",     {},{}},
        [60] = {"Castle Zvahl Keep",        {},{}},
        [61] = {"Ranguemont Pass",          {},{}},
        [62] = {"Bostaunieux Oubliette",    {},{}},
        [63] = {"Toraimarai Canal",         {},{}},
        [64] = {"Zeruhn Mines",             {},{}},
        [65] = {"Korroloka Tunnel",         {},{}},
        [66] = {"Kuftal Tunnel",            {},{}},
        [67] = {"The Eldieme Necropolis",   {},{}},
        [68] = {"Sea Serpent Grotto",       {},{}},
        [69] = {"Dangruf Wadi",             {},{}},
        [70] = {"Inner Horutoto Ruins",     {},{}},
        [71] = {"Outer Horutoto Ruins",     {},{}},
        [72] = {"Ordelle's Caves",          {},{}},
        [73] = {"Gusgen Mines",             {},{}},
        [74] = {"Crawler's Nest",           {},{}},
        [75] = {"Maze of Shakhrami",        {},{}},
        [76] = {"Garlaige Citadel",         {},{}},
        [77] = {"Fei'Yin",                  {},{}},
        [78] = {"Ifrit's Cauldron",         {},{}},
        [79] = {"Quicksand Caves",          {},{}},
        [80] = {"Gustav Tunnel",            {},{}},
        [81] = {"Labyrinth of Onzozo",      {},{}},
        [82] = {"Dynamis - Bastok",         {},{}},
        [83] = {"Dynamis - San d'Oria",     {},{}},
        [84] = {"Dynamis - Windurst",       {},{}},
        [85] = {"Dynamis - Jeuno",          {},{}},
        [86] = {"Dynamis - Beaucedine",     {},{}},
        [87] = {"Dynamis - Xarcabard",      {},{}},
        [88] = {"Ru'Aun Gardens",           {},{}},
        [89] = {"Ve'Lugannon Palace",       {},{}},
        [90] = {"The Shrine of Ru'Avitau",  {},{}},
        [91] = {"Al'Taieu",                 {},{}},
        [92] = {"Grand Palace of Hu'Xzoi",  {},{}},
        [93] = {"The Garden of Ru'Hmet",    {},{}},
        [94] = {"Lufaise Meadows",          {},{}},
        [95] = {"Misareaux Coast",          {},{}},
        [96] = {"Phomiuna Aqueducts",       {},{}},
        [97] = {"Sacrarium",                {},{}},
        [98] = {"Riverne Site-A01",         {},{}},
        [99] = {"Riverne Site-B01",         {},{}},
        [100] = {"Escha - Zi'Tah",          {},{}},
        [101] = {"Escha - Ru'Aun",          {},{}}
    }

    local handleMidnight = function(player)
        local questMidnight = player:getCharVar("[DailyQuest]Midnight")
        local currentMidnight = getMidnight()

        -- handle first time quest midnight
        if questMidnight == 0 then
            player:setCharVar("[DailyQuest]Midnight",currentMidnight)
            player:setCharVar("[DailyQuest]Fishstix",0)
            player:setCharVar("[DailyQuest]Murdoc",0)
            player:setCharVar("[DailyQuest]Mistrix",0)
            player:setCharVar("[DailyQuest]Saltlik",0)
            player:setCharVar("[DailyQuest]Beetrix",0)
        end
        
        -- handle midnight reset
        if currentMidnight < questMidnight then
            player:setCharVar("[DailyQuest]Midnight",currentMidnight)
            player:setCharVar("[DailyQuest]Fishstix",0)
            player:setCharVar("[DailyQuest]Murdoc",0)
            player:setCharVar("[DailyQuest]Mistrix",0)
            player:setCharVar("[DailyQuest]Saltlik",0)
            player:setCharVar("[DailyQuest]Beetrix",0)
        end
    end

    local beetrix = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Beetrix",
        look = 494,
        x = -50.7539,
        y = 0.000,
        z = -56.3718,
        rotation = 19,
        widescan = 1,

        onTrade = function(player, npc, trade)
            handleMidnight(player)
            local questStage = player:getCharVar("[DailyQuest]Beetrix")

            -- handle quest stages
            if questStage == 1 then
                local questZone = player:getCharVar("[DailyQuest]Beetrix_zone")
                local randrExItem = player:getCharVar("[DailyQuest]Beetrix_RExItem")
                local questRExItemName = questLocations[questZone][2][randrExItem]
                local questRExItemID = questLocations[questZone][3][randrExItem]
                if npcUtil.tradeHasExactly(trade, questRExItemID) then
                    player:tradeComplete()
                    player:setCharVar("[DailyQuest]Beetrix",2)
                    player:PrintToPlayer("Congratulations! You've completed my quest for today, here's your reward!", 0, npc:getPacketName())
                    player:addCurrency('bayld', 5)
                    player:PrintToPlayer("You have obtained 5 bayld!", 17)
                    return
                else
                    player:PrintToPlayer(string.format("I said I need a %s, please try again!",string.upper(questRExItemName)), 0, npc:getPacketName())
                    return
                end
                return
            else
                player:PrintToPlayer("I don't require any items from you.", 0, npc:getPacketName())
                return
            end
        end,

        onTrigger = function(player, npc)
            handleMidnight(player)
            local questStage = player:getCharVar("[DailyQuest]Beetrix")
            
            -- handle quest stages
            if questStage == 0 then
                local randNum = 1 -- force to West Ronfaure for testing
                --local randNum = math.random(1,101)
                local questZoneName = questLocations[randNum][1]
                local rExItemListLength = table.getn(questLocations[randNum][2])
                local randrExItem = math.random(1,rExItemListLength)
                local questRExItemName = questLocations[randNum][2][randrExItem]
                player:setCharVar("[DailyQuest]Beetrix",1)
                player:setCharVar("[DailyQuest]Beetrix_zone",randNum)
                player:setCharVar("[DailyQuest]Beetrix_RExItem",randrExItem)
                player:PrintToPlayer(string.format("Go to %s, get me a %s and trade it to me!",questZoneName, questRExItemName), 0, npc:getPacketName())
                return
            elseif questStage == 1 then
                local questZone = player:getCharVar("[DailyQuest]Beetrix_zone")
                local randrExItem = player:getCharVar("[DailyQuest]Beetrix_RExItem")
                local questZoneName = questLocations[questZone][1]
                local questRExItemName = questLocations[questZone][2][randrExItem]
                player:PrintToPlayer(string.format("Go to %s, get me a %s and trade it to me!",questZoneName, questRExItemName), 0, npc:getPacketName())
                return
            elseif questStage == 2 then
                player:PrintToPlayer("You've already completed this quest today! Come back tomorrow for more.", 0, npc:getPacketName())
                return
            end
        end,
    })

    utils.unused(beetrix)

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
