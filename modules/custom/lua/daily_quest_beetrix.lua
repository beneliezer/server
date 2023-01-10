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
        [39] = {"Mount Zhayolm",            {"Lyft Ferule","Octant"},                                                                           {18872,19232}},
        [40] = {"Halvung",                  {"Wayang Kulit Mantle","Mercenary's Mantle","Mercenary's Subligar","Musanto","Mercenary's Boots","Volunteer's Earring","Halvung Shakudo Key"},  {11536,16222,15624,19279,15709,15984,2221}},
        [41] = {"Mamook",                   {"Volunteer's Belt","Volunteer's Khud","Beast Bazubands","Lyft Hexagun","Ryumon"},                  {15898,16082,14958,19234,18422}},
        [42] = {"Aydeewa Subterrane",       {"Fenrir's Crown"},                                                                                 {11496}},
        [43] = {"Alzadaal Undersea Ruins",  {"Surge Subligar","Lyft Crossbow","Narigitsune"},                                                   {16375,19233,19280}},
        [44] = {"Caedarva Mire",            {"Cinquedea","Lyft Scythe","Timeworn Talisman"},                                                    {19123,18958,2861}},
        [45] = {"Yughott Grotto",           {"Orcish Armor Plate","Cathedral Tapestry","Red Cryptex","Castle Floor Plans"},                     {2757,1662,1528,530}},
        [46] = {"Fort Ghelsba",             {"Auriga Xiphos","Frugal Cape"},                                                                    {17708,11529}},
        [47] = {"Palborough Mines",         {"Darksteel Engraving"},                                                                            {1529}},
        [48] = {"Giddeus",                  {"Aspir Knife","Parana Shield","Yagudo Caulk","Seven-Knot Quipu"},                                  {16509,12298,2759,1530}},
        [49] = {"Beadeaux",                 {"Quadav Charm","Silver Engraving","Quadav Mage Blood","Quadav Stew"},                              {495,1533,1114,4569}},
        [50] = {"Davoi",                    {"Curse Wand","Jade Cryptex","Shaman Garlic"},                                                      {17437,1532,1018}},
        [51] = {"Monastic Cavern",          {"Nightmare Sword","Soiled Letter"},                                                                {17649,1686}},
        [52] = {"Castle Oztroja",           {"Thirteen-Knot Quipu","Yagudo Holy Water","Judgment Key"},                                         {1535,1097,1142}},
        [53] = {"The Boyahda Tree",         {"Carver's Torque","Mushroom Helm","Luna Subligar","Fransisca"},                                    {10948,13913,14287,17925}},
        [54] = {"Lower Delkfutt's Tower",   {"Ram Leather Missive","Northern Fur"},                                                             {1538,1199}},
        [55] = {"Middle Delkfutt's Tower",  {"Ram Leather Missive","Northern Fur"},                                                             {1538,1199}},
        [56] = {"Upper Delkfutt's Tower",   {"Delkfutt Key","Hoary Battle Horn","Moldy Buckler"},                                               {549,2386,2385}},
        [57] = {"Den of Rancor",            {"Goldsmith's Torque","Skirnir's Wand","Asklepios","Kitsutsuki","Amanojaku","Uggalepih Necklace"},  {10950,17455,17454,16912,16911,13147}},
        [58] = {"Castle Zvahl Baileys",     {"Astrolabe","Whine Cellar Key","Demon Pen"},                                                       {19239,1106,1653}},
        [59] = {"Castle Zvahl Keep",        {"Yagudo Holy Water","Soiled Letter"},                                                              {1097,1686}},
        [60] = {"Ranguemont Pass",          {"Spelunker's Hat","Wit Pendant","Glittersand"},                                                    {15222,16300,1107}},
        [61] = {"Bostaunieux Oubliette",    {"Bloodbead Ring","Shadow Mask","Ascalon","Jelly Ring","Sukesada"},                                 {13302,13912,16943,13303,16980}},
        [62] = {"Toraimarai Canal",         {"Laran's Pendant","Starmite Shell"},                                                               {16303,906}},
        [63] = {"Zeruhn Mines",             {"Prouesse Ring"},                                                                                  {11677}},
        [64] = {"Korroloka Tunnel",         {"Nadrs","Webcutter"},                                                                              {17650,18040}},
        [65] = {"Kuftal Tunnel",            {"Acha d'Armas","Arondight","Astral Aspis","Bano del Sol","Bunny Fang Sack","Shoalweed"},           {17926,16945,12382,17981,1541,1148}},
        [66] = {"The Eldieme Necropolis",   {"Swan Bilbo","Tavnazia Bell","Ancient Papyrus"},                                                   {17709,1098,1088}},
        [67] = {"Sea Serpent Grotto",       {"Frog Trousers","Minstrel's Coat","Calamar","Exocets","Mermaid Tail","Pagures","Narval"},          {14286,13804,16882,17503,1483,17504,16884}},
        [68] = {"Dangruf Wadi",             {"Gassan","Quadav Backscale"},                                                                      {18412,2758}},
        [69] = {"Inner Horutoto Ruins",     {"Yagudo Caulk","Trailer's Tunica"},                                                                {2759,14464}},
        [70] = {"Outer Horutoto Ruins",     {"Fisher's Torque","Fidelity Mantle"},                                                              {10925,11531}},
        [71] = {"Ordelle's Caves",          {"Morbolger Vine","Galka Fang Sack","Shikaree Ring"},                                               {1013,1531,15551}},
        [72] = {"Gusgen Mines",             {"Magicked Skull"},                                                                                 {538}},
        [73] = {"Crawler's Nest",           {"Dasra's Ring","Exoray Mold","Bag of Seeds"},                                                      {15853,1089,1105}},
        [74] = {"Maze of Shakhrami",        {"Burnite Shell","Mithra Fang Sack"},                                                               {16511,1534}},
        [75] = {"Garlaige Citadel",         {"Selemnus Belt","Promptitude Solea","Sleight Kukri","Bomb Coal"},                                  {15944,11404,19121,1090}},
        [76] = {"Fei'Yin",                  {"Lleu's Charm","Retaliators"},                                                                     {16299,18752}},
        [77] = {"Ifrit's Cauldron",         {"Smithy's Torque","Avengers","Bomb Queen Ring","Power Staff","Valiant Knife","Ascention","Lohar","Gae Bolg","Rattling Egg"},{10949,16426,13567,17563,17983,18042,17927,16885,1189}},
        [78] = {"Quicksand Caves",          {"Tanner's Torque","Shaman's Cloak","Protecting Bangles","Xhifhut Head","Sand Gloves","Dainslaif","Dune Boots","Loxley Bow","Pendragon Axe","Tungi","Xhifhut Strings","Xhifhut Body"},{10952,13803,14063,1479,14064,17651,14168,17199,16734,17924,1476,1477}},
        [79] = {"Gustav Tunnel",            {"Culinarian's Torque","Liminus Earring","Kamewari","Eisentaenzer","Cocytus Pole","Ungur Boomerang","Othinus' Bow"},{10955,11041,16968,16727,17564,18141,17244}},
        [80] = {"Labyrinth of Onzozo",      {"A l'Outrance","Moldavite Earring","Assault Jerkin","Schwarz Axt","Kard"},                         {18041,14724,13805,16728,17982}},
        [81] = {"Dynamis - Bastok",         {"Relic Axe","Relic Blade","Relic Scythe","Ito"},                                                   {18284,18278,18302,18314}},
        [82] = {"Dynamis - San d'Oria",     {"Ihintanto","Relic Bhuj","Relic Gun","Relic Lance"},                                               {18308,18290,18332,18296}},
        [83] = {"Dynamis - Windurst",       {"Relic Dagger","Relic Knuckles","Relic Maul","Relic Sword"},                                       {18266,18260,18320,18272}},
        [84] = {"Dynamis - Jeuno",          {"Relic Bow","Relic Horn","Relic Shield","Relic Staff"},                                            {18344,18338,15066,18326}},
        [85] = {"Dynamis - Beaucedine",     {"Attestation of Accuracy","Attestation of Bravery","Attestation of Celerity","Attestation of Decisiveness","Attestation of Force","Attestation of Fortitude","Attestation of Glory","Attestation of Harmony","Attestation of Invulnerability","Attestation of Legerity","Attestation of Might","Attestation of Righteousness","Attestation of Sacrifice","Attestation of Transcendence","Attestation of Vigor","Attestation of Virtue"},{1570,1560,1557,1565,1561,1563,1558,1569,1821,1564,1556,1559,1566,1568,1562,1567}},
        [86] = {"Dynamis - Xarcabard",      {"Celestial Fragment","Demoniac Fragment","Divine Fragment","Ethereal Fragment","Heavenly Fragment","Holy Fragment","Intricate Fragment","Mysterial Fragment","Mystic Fragment","Ornate Fragment","Runaeic Fragment","Seraphic Fragment","Snarled Fragment","Stellar Fragment","Supernal Fragment","Tenebrous Fragment"},{1582,1579,1580,1585,1581,1573,1574,1584,1571,1572,1575,1576,1583,1578,1822,1577}},
        [87] = {"Ru'Aun Gardens",           {"Caract Choker","Byakko's Axe","Scarecrow Scythe","Genbu's Shield","Seiryu's Sword","Suzaku's Scythe"},{16284,18198,18044,12296,17659,18043}},
        [88] = {"Ve'Lugannon Palace",       {"Alchemist's Torque","Indra Katars","Ushikirimaru"},                                               {10954,17511,17804}},
        [89] = {"The Shrine of Ru'Avitau",  {"Weaver's Torque","Tonbo-Giri","Shiranui","Skofnung","Ulfhedinn Axe"},                             {10951,16838,17774,16956,18199}},
        [90] = {"Al'Taieu",                 {"Aern Organ","Luminian Tissue","Hpemde Organ","Phuabo Organ","Xzomit Organ"},                      {1786,1783,1787,1784,1785}},
        [91] = {"Grand Palace of Hu'Xzoi",  {"Luminion Chip","Euvhi Organ"},                                                                    {1819,1818}},
        [92] = {"The Garden of Ru'Hmet",    {"Luminion Chip","Euvhi Organ"},                                                                    {1819,1818}},
        [93] = {"Lufaise Meadows",          {"Galliard Trousers","Extra-Fine File","Chameleon Diamond","Tavnazian Liver"},                      {15425,1698,1666,5154}},
        [94] = {"Misareaux Coast",          {"Misareaux Garlic","Altdorf's Earring","Shepherd's Chain","Tavnazian Liver"},                      {1661,16035,16297,5154}},
        [95] = {"Phomiuna Aqueducts",       {"Chiroptera Dagger","Niokiyotsuna","Vampiric Claws","Fomor Tunic","Sinister Mask"},                {18007,17794,17510,14466,15219}},
        [96] = {"Sacrarium",                {"Swift Belt","Coral Crest Key","Sealion Crest Key"},                                               {15457,1659,1658}},
        [97] = {"Riverne Site-A01",         {"Dobson Bandana","Jaeger Ring","Voyager Sallet","Giant Scale","Copper Key"},                       {15183,14669,15184,1691,1665}},
        [98] = {"Riverne Site-B01",         {"Auditory Torque","Boroka Earring","Soboro Sukehiro","Giant Scale"},                               {13178,14763,17813,1691}}
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
            local completedDailyQuests = player:getCharVar("[DailyQuest]Completed")

            -- handle quest stages
            if questStage == 1 then
                local questZone = player:getCharVar("[DailyQuest]Beetrix_zone")
                local randrExItem = player:getCharVar("[DailyQuest]Beetrix_RExItem")
                local questRExItemName = questLocations[questZone][2][randrExItem]
                local questRExItemID = questLocations[questZone][3][randrExItem]
                if npcUtil.tradeHasExactly(trade, questRExItemID) then
                    player:tradeComplete()
                    player:setCharVar("[DailyQuest]Beetrix",2)
                    player:setCharVar("[DailyQuest]Completed",completedDailyQuests + 1)
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
                local randNum = math.random(1,98)
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
end)

return m
