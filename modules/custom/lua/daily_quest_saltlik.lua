-----------------------------------
-- Daily Quest : Saltlik
-- Kill a certain NM
-----------------------------------
require("modules/module_utils")
require("scripts/globals/zone")
require("scripts/zones/Lower_Jeuno/Zone")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("daily_quest_saltlik")

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)

    local questLocations =
    {
        -- [index] | Zone Name | NM Name
        [1] = {"West Ronfaure",             {"Amanita","Jaggedy-Eared-Jack","Fungus Beetle"}},
        [2] = {"East Ronfaure",             {"Bigmouth Billy","Swamfisk","Rambukk"}},
        [3] = {"South Gustaberg",           {"Tococo","Leaping Lizzy","Carnero"}},
        [4] = {"North Gustaberg",           {"Stinging Sophie","Maighdean Uaine","Bedrock Barry"}},
        [5] = {"West Sarutabaruta",         {"Numbing Norman","Nunyenunc","Tom Tit Tat"}},
        [6] = {"East Sarutabaruta",         {"Duke Decapod","Spiny Spipi","Sharp-Eared Ropipi"}},
        [7] = {"La Theine Plateau",         {"Nihniknoovi","Slumbering Samwell","Tumbling Truffle","Lumbering Lambert","Goblin Archaeologist","Bloodtear Baldurf"}},
        [8] = {"Konschtat Highlands",       {"Ghillie Dhu","Goblin Archaeologist","Highlander Lizard","Rampaging Ram","Steelfleece Baldarich","Stray Mary"}},
        [9] = {"Tahrongi Canyon",           {"Yara Ma Yha Who","Habrok","Serpopard Ishtar","Goblin Archaeologist","Herbage Hunter"}},
        [10] = {"Valkurm Dunes",            {"Metal Shears","Golden Bat","Valkurm Emperor","Hippomaritimus"}},
        [11] = {"Jugner Forest",            {"Panzer Percival","Fraelissa","Meteormauler Zhagtegg","Sappy Sycamore","Supplespine Mujwuj"}},
        [12] = {"Batallia Downs",           {"Tottering Toby","Weeping Willow","Eyegouger","Ahtu","Lumber Jack","Prankster Maverix","Skirling Liger"}},
        [13] = {"Pashhow Marshlands",       {"Bloodpool Vorax","Bo'Who Warmonger","Jolly Green","Toxic Tamlyn","Ni'Zho Bladebender"}},
        [14] = {"Rolanberry Fields",        {"Black Triple Stars","Drooling Daisy","Silk Caterpillar","Ravenous Crawler","Eldritch Edge"}},
        [15] = {"Sauromugue Champaign",     {"Deadly Dodo","Bashe","Thunderclaw Thuban","Blighting Brand"}},
        [16] = {"Beaucedine Glacier",       {"Calcabrina","Gargantua","Humbaba","Kirata","Nue"}},
        [17] = {"Xarcabard",                {"Barbaric Weapon","Duke Focalor","Ereshkigal","Shadow Eye","Timeworn Warrior"}},
        [18] = {"Cape Teriggan",            {"Frostmane","Kreutzet","Killer Jonny","Tegmine","Zmey Gorynych"}},
        [19] = {"Eastern Altepa Desert",    {"Centurio XII-I","Donnergugi","Dune Widow","Nandi"}},
        [20] = {"Western Altepa Desert",    {"Cactuar Cantautor","Calchas","Celphie","Dahu","Picolaton"}},
        [21] = {"Meriphataud Mountains",    {"Daggerclaw Dracos","Patripatan","Chonchon","Waraxe Beak","Naa Zeku the Unwaiting"}},
        [22] = {"Buburimu Peninsula",       {"Backoo","Buburimboo","Helldiver","Wake Warder Wanda"}},
        [23] = {"The Sanctuary of Zi'Tah",  {"Bastet","Elusive Edwin","Huwasi","Keeper of Halidom","Noble Mold"}},
        [24] = {"Ro'Maeve",                 {"Nightmare Vase","Martinet","Nargun","Rogue Receptacle"}},
        [25] = {"Yuhtunga Jungle",          {"Bayawak","Koropokkur","Meww the Turtlerider","Mischievous Micholas","Pyuu the Spatemaker","Rose Garden","Voluptuous Vilma"}},
        [26] = {"Yhoator Jungle",           {"Acolnahuacatl","Bisque-heeled Sunberry","Bright-handed Kunberry","Edacious Opo-opo","Hoar-knuckled Rimberry","Powderer Penny","Woodland Sage"}},
        [27] = {"Qufim Island",             {"Dosetsu Tree","Slippery Sucker","Trickster Kinetix","Atkorkamuy","Qoofim"}},
        [28] = {"Temple of Uggalepih",      {"Bonze Marberry","Death from Above","Flauros","Habetrot","Manipulator","Sacrificial Goblet","Sozu Terberry","Tonberry Kinq"}},
        [29] = {"Valley of Sorrows",        {"Adamantoise"}},
        [30] = {"Bibiki Bay",               {"Intulo","Splacknuck","Shankha","Serra"}},
        [31] = {"Carpenter's Landing",      {"Hercules Beetle","Mycophile","Orctrap","Tempest Tigon"}},
        [32] = {"Uleguerand Range",         {"Black Coney","Bonnacon","Father Frost","Geush Urvan","Magnotaur","Mountain Worm","Skvader","Snow Maiden","White Coney"}},
        [33] = {"Attohwa Chasm",            {"Ambusher Antlion","Citipati","Sargas","Sekhmet"}},
        [34] = {"Oldton Movalpolos",        {"Bugbear Strongman","Goblin Wolfman","Bugbear Muscleman"}},
        [35] = {"Newton Movalpolos",        {"Bugbear Matman","Goblin Collector","Sword Sorcerer Solisoq","Swashstox Beadblinker"}},
        [36] = {"Wajaom Woodlands",         {"Gharial","Jaded Jody","Zoraal Ja's Pkuucha"}},
        [37] = {"Bhaflau Thickets",         {"Emergent Elm","Harvestman","Mahishasura","Nis Puk"}},
        [38] = {"Arrapago Reef",            {"Bloody Bones","Euryale","Lamie No.7","Lamie No.8","Lamie No.9","Lamia No.19","Merrow No.5"}},
        [39] = {"Mount Zhayolm",            {}},
        [40] = {"Halvung",                  {}},
        [41] = {"Mamook",                   {}},
        [42] = {"Aydeewa Subterrane",       {}},
        [43] = {"Alzadaal Undersea Ruins",  {}},
        [44] = {"Nyzul Isle",               {}},
        [45] = {"Caedarva Mire",            {}},
        [46] = {"Yughott Grotto",           {}},
        [47] = {"Fort Ghelsba",             {}},
        [48] = {"Palborough Mines",         {}},
        [49] = {"Giddeus",                  {}},
        [50] = {"Beadeaux",                 {}},
        [51] = {"Davoi",                    {}},
        [52] = {"Monastic Cavern",          {}},
        [53] = {"Castle Oztroja",           {}},
        [54] = {"The Boyahda Tree",         {}},
        [55] = {"Lower Delkfutt's Tower",   {}},
        [56] = {"Middle Delkfutt's Tower",  {}},
        [57] = {"Upper Delkfutt's Tower",   {}},
        [58] = {"Den of Rancor",            {}},
        [59] = {"Castle Zvahl Baileys",     {}},
        [60] = {"Castle Zvahl Keep",        {}},
        [61] = {"Ranguemont Pass",          {}},
        [62] = {"Bostaunieux Oubliette",    {}},
        [63] = {"Toraimarai Canal",         {}},
        [64] = {"Zeruhn Mines",             {}},
        [65] = {"Korroloka Tunnel",         {}},
        [66] = {"Kuftal Tunnel",            {}},
        [67] = {"The Eldieme Necropolis",   {}},
        [68] = {"Sea Serpent Grotto",       {}},
        [69] = {"Dangruf Wadi",             {}},
        [70] = {"Inner Horutoto Ruins",     {}},
        [71] = {"Outer Horutoto Ruins",     {}},
        [72] = {"Ordelle's Caves",          {}},
        [73] = {"Gusgen Mines",             {}},
        [74] = {"Crawler's Nest",           {}},
        [75] = {"Maze of Shakhrami",        {}},
        [76] = {"Garlaige Citadel",         {}},
        [77] = {"Fei'Yin",                  {}},
        [78] = {"Ifrit's Cauldron",         {}},
        [79] = {"Quicksand Caves",          {}},
        [80] = {"Gustav Tunnel",            {}},
        [81] = {"Labyrinth of Onzozo",      {}},
        [82] = {"Dynamis - Bastok",         {}},
        [83] = {"Dynamis - San d'Oria",     {}},
        [84] = {"Dynamis - Windurst",       {}},
        [85] = {"Dynamis - Jeuno",          {}},
        [86] = {"Dynamis - Beaucedine",     {}},
        [87] = {"Dynamis - Xarcabard",      {}},
        [88] = {"Ru'Aun Gardens",           {}},
        [89] = {"Ve'Lugannon Palace",       {}},
        [90] = {"The Shrine of Ru'Avitau",  {}},
        [91] = {"Al'Taieu",                 {}},
        [92] = {"Grand Palace of Hu'Xzoi",  {}},
        [93] = {"The Garden of Ru'Hmet",    {}},
        [94] = {"Lufaise Meadows",          {}},
        [95] = {"Misareaux Coast",          {}},
        [96] = {"Phomiuna Aqueducts",       {}},
        [97] = {"Sacrarium",                {}},
        [98] = {"Riverne Site-A01",         {}},
        [99] = {"Riverne Site-B01",         {}},
        [100] = {"Escha - Zi'Tah",          {}},
        [101] = {"Escha - Ru'Aun",          {}}
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

    local saltlik = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Saltlik",
        look = 492,
        x = -51.7539,
        y = 0.000,
        z = -58.3718,
        rotation = 19,
        widescan = 1,

        onTrade = function(player, npc, trade)
            player:PrintToPlayer("I don't require any items from you.", 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
            handleMidnight(player)
            local questStage = player:getCharVar("[DailyQuest]Saltlik")
            
            -- handle quest stages
            if questStage == 0 then
                local randNum = 1 -- force to West Ronfaure for testing
                --local randNum = math.random(1,101)
                local questZoneName = questLocations[randNum][1]
                local nmListLength = table.getn(questLocations[randNum][2])
                local randNM = math.random(1,nmListLength)
                local questNMName = questLocations[randNum][2][randNM]
                player:setCharVar("[DailyQuest]Saltlik",1)
                player:setCharVar("[DailyQuest]Saltlik_zone",randNum)
                player:setCharVar("[DailyQuest]Saltlik_NM",randNM)
                player:PrintToPlayer(string.format("Go to %s and kill %s!",questZoneName, questNMName), 0, npc:getPacketName())
                return
            elseif questStage == 1 then
                local questZone = player:getCharVar("[DailyQuest]Saltlik_zone")
                local questNM = player:getCharVar("[DailyQuest]Saltlik_NM")
                local questZoneName = questLocations[questZone][1]
                local questNMName = questLocations[questZone][2][questNM]
                player:PrintToPlayer(string.format("Go to %s and kill %s!",questZoneName, questNMName), 0, npc:getPacketName())
                return
            elseif questStage == 2 then
                player:setCharVar("[DailyQuest]Saltlik",3)
                player:PrintToPlayer("Congratulations! You've completed my quest for today, here's your reward!", 0, npc:getPacketName())
                player:addCurrency('bayld', 4)
                player:PrintToPlayer("You have obtained 4 bayld!", 17)
                return
            elseif questStage == 3 then
                player:PrintToPlayer("You've already completed this quest today! Come back tomorrow for more.", 0, npc:getPacketName())
                return
            end
        end,
    })

    utils.unused(saltlik)

    local dailyNMs =
    {
        { 1, 1, "West_Ronfaure", "Amanita"            },
        { 1, 2, "West_Ronfaure", "Jaggedy-Eared_Jack" },
        { 1, 3, "West_Ronfaure", "Fungus_Beetle"      }
    }

    for _, entry in pairs(dailyNMs) do
        local zoneNum  = entry[1]
        local nmNum    = entry[2]
        local zoneName = entry[3]
        local mobName  = entry[4]

        --print(string.format("xi.zones.%s.mobs.%s.onMobDeath", zoneName, mobName))

        m:addOverride(string.format("xi.zones.%s.mobs.%s.onMobDeath", zoneName, mobName), function(mob, player, optParams)
            super(mob, player, optParams)

            --print(string.format("%s killed",mob:getName()))
            
            local dailyQuestActive = player:getCharVar("[DailyQuest]Saltlik")
            local dailyZone        = player:getCharVar("[DailyQuest]Saltlik_zone")
            local dailyNM          = player:getCharVar("[DailyQuest]Saltlik_NM")

            if
                dailyQuestActive == 1 and
                dailyZone == zoneNum and
                dailyNM == nmNum
            then
                if optParams.isKiller then
                    player:setCharVar("[DailyQuest]Saltlik",2)
                    player:PrintToPlayer(string.format("You've killed %s, please return to Saltlik to claim your reward!",mob:getName()), 17)
                end
            end
        end)
    end
end)

return m
