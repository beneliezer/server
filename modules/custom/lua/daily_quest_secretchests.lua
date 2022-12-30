-----------------------------------
-- Daily Quest : Secret Chests
-- Spawns Secret Treasure Chests in certain zones
-----------------------------------
require("modules/module_utils")
require("scripts/globals/zone")
-----------------------------------
local m = Module:new("daily_quest_secretchests")

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

local treasureCostumeID = 267
local treasurePositions =
{
    -- Zone Num | Zone Name | Zone ID | POS Locations
    {1,"West_Ronfaure",                 100,{{-29,-60,219,87},{-178,-60,317,128},{-547.2,-59.6,517.5,158},{-483.5,-46.7,226.7,8},{-236,-40,63,243},{-294.65,-32.33,-26.1,132},{-454.77,-32.33,14.25,121},{-614.63,-24.57,-151.53,242},{-521.7,0,-438.05,166},{-289.07,0.5,-521.45,97},{-181.4,0,-501.3,98},{-68.55,-0.16,-538.55,193},{-50.54,-9.5,-398.48,0}}},
    {2,"East_Ronfaure",                 101,{{220.486,0,-538.182,190},{249.895,0,-538.190,190},{289.832,0,-501.681,60},{263.351,0,-501.572,60},{330.044,0,-538.601,190},{321.404,-60,522.386,61},{420.042,-65.732,445.202,99},{498.765,-60.038,469.305,192},{507.972,-60.011,458.204,1},{767.483,-61.362,400.100,130}}},
    {3,"South_Gustaberg",               107,{{-493.839,40,-482.177,202},{-423.172,43.698,-461.885,174},{-289.327,21.262,-382.687,252},{-264.201,18.452,-313.208,84},{-191.268,17.982,-427.840,128},{-123.347,18.781,-483.586,222},{70.422,-5.777,-463.857,98},{363.695,-1.236,684.129,158},{520.142,-2.924,736.791,189}}},
    {4,"North_Gustaberg",               106,{{-589.808,40,54.876,222},{-437.971,0,479.694,0},{506.035,0.301,428.598,5},{441.289,0,405.997,43},{320.726,-2.797,329.384,58},{200.299,0.055,324.101,94},{150.093,-5.715,336.141,83},{129.516,-2.763,399.964,115},{86.767,0.459,527.733,122},{-74.624,-0.077,599.272,4}}},
    {5,"West_Sarutabaruta",             115,{{-370.861,-22.244,216.441,252},{-411.797,-17.725,327.605,1},{-258.004,-17.250,660.441,254},{-189.890,-26.054,496.843,128},{-5.394,-12.484,308.276,64},{238.214,-9.900,40.014,0},{-1.329,0,-156.606,39},{-61.796,-6.163,-250.548,191},{-121.292,-4.941,-287.890,188},{104.838,-0.931,-203.319,122}}},
    {6,"East_Sarutabaruta",             116,{{233.289,-24.662,560.574,6},{-59.756,-37.250,734.799,63},{-273.952,-22.770,662.066,255},{286.569,-2.700,261.747,255},{446.820,-2.500,298.321,127},{378.862,-13.250,99.907,128},{446.889,9.343,-139.345,255},{485.318,9.500,-140.142,121},{-246.174,-3.735,-160.158,34},{-351.037,-3.057,-130.521,117}}},
    {7,"La_Theine_Plateau",             102,{{-266.886,4.334,291.993,114},{-441.370,6.356,229.318,66},{-449.020,-8.029,293.092,135},{-607.264,0.083,474.459,100},{-561.724,0,637.696,177},{-180.001,8.820,254.831,36},{338.781,19.104,-63.751,144},{434.970,24,22.074,198},{748.774,29.002,-16.079,242},{563.891,41.371,-427.724,124}}},
    {8,"Konschtat_Highlands",           108,{{563.063,30.777,635.960,154},{458.349,31.260,464.815,152},{233.449,24,300.122,187},{142.523,19.104,223.923,93},{402.982,-1.207,-3.363,154},{-233.059,16.361,199.887,7},{-328.557,16.044,195.746,124},{-705.982,2.818,103.857,237},{-263.467,-49.471,-466.454,206},{94.111,-69.003,-577.422,119}}},
    {9,"Tahrongi_Canyon",               117,{{361.894,-8.946,-87.874,160},{200.877,-24.986,-168.091,188},{-42.281,46.931,-672.194,19},{207.646,15.117,-680.856,118},{90.488,1.173,-109.851,59},{78.790,15.712,114.882,220},{176.975,35.150,262.554,63},{117.653,40,355.244,129},{450.495,46.388,495.988,78},{-152.077,47.044,641.737,129}}},
    {10,"Valkurm_Dunes",                103,{{93.458,-2.327,-112.212,110},{124.903,-7.349,92.950,214},{325.594,-8.250,76.057,153},{368.845,-0.533,-127.749,156},{-269.074,1.901,-158.253,231},{-361.166,0.303,-12.603,10},{-306.172,-11.030,252.209,93},{-468.335,-18.286,366.880,82},{-628.852,-10.691,211.435,95},{-797.904,-6.050,51.110,220}}},
    {11,"Jugner_Forest",                104,{}},
    {12,"Batallia_Downs",               105,{}},
    {13,"Pashhow_Marshlands",           109,{}},
    {14,"Rolanberry_Fields",            110,{}},
    {15,"Sauromugue_Champaign",         120,{}},
    {16,"Beaucedine_Glacier",           111,{}},
    {17,"Xarcabard",                    112,{}},
    {18,"Cape_Teriggan",                113,{}},
    {19,"Eastern_Altepa_Desert",        114,{}},
    {20,"Western_Altepa_Desert",        125,{}},
    {21,"Meriphataud_Mountains",        119,{}},
    {22,"Buburimu_Peninsula",           118,{}},
    {23,"The_Sanctuary_of_ZiTah",       121,{}},
    {24,"RoMaeve",                      122,{}},
    {25,"Yuhtunga_Jungle",              123,{}},
    {26,"Yhoator_Jungle",               124,{{250.3906,0.1698,-532.5775,184},{277.1335,0,-399.6764,192},{215.8089,0.0787,32.6307,194},{91.3226,0,196.0168,150},{-101.8786,-1.4944,52.0368,213},{-253.4885,6.6471,28.4988,93},{-498.4855,8.8406,-188.6802,222},{-459.4060,1.5500,-331.7365,164},{-256.4169,0.0316,-458.8336,195},{1.6,0.1,-347.2178,128}}},
    {27,"Qufim_Island",                 126,{{-267.7306,-19.5779,402.3297,240},{-340.6172,-12.1026,539.2167,9},{-130.7917,-21.4513,413.4923,6},{-111.9717,-19.6915,229.8066,198},{45.2582,-20.0641,283.0483,233},{181.1417,-22.3171,135.8035,221},{167.4396,-21.9135,28.6876,167},{93.4568,-21.5034,-51.1449,32},{-35.4559,-21.7744,-53.7631,110},{173.5320,-21.9593,-28.5420,65},{96.5474,17.9617,-263.3933,19}}},
    {28,"Temple_of_Uggalepih",          159,{{76.4836,0,-39.3,191},{66.4732,1.4603,-60.2844,78},{-210.9982,0,-13.6968,105},{-132.7098,0,-67.8487,64},{-20.5119,0.5,-82.6116,0},{-27.2094,-24.9999,37.7444,96},{-27.4638,-17,-147.8486,65},{267.8488,0,112.7122,1},{347.3,-0.0009,222.8087,127},{425.5971,5.2471,223.3,64}}},
    {29,"Valley_of_Sorrows",            128,{{141.0560,-5.8524,-58.5018,92},{101.4715,-0.3392,-11.4836,199},{-57.2116,-5.0907,55.0726,5},{-104.8795,-5.0855,17.0616,80},{-176.1701,-11.4837,13.2509,120},{-130.4733,-2.4491,-25.5167,15},{-18.7014,-1.5429,-55.3335,155},{36.4795,-0.6639,49.9907,46},{106.1917,-3.9239,-49.5341,216},{99.5238,-9.0230,-103.0284,197}}},
    {30,"Bibiki_Bay",                     4,{{649.2197,-21.1735,838.9446,126},{569.2031,-19.9828,753.0187,119},{477.8183,-5,777.5853,26},{454.0760,-3.0024,729.1177,2},{241.0836,-37.1751,849.2199,63},{146.7451,-37.9250,613.5005,177},{273.1945,-20.7964,602.9559,54},{337.7320,-22.3767,330.3999,55},{335.1253,-16.1852,234.6558,22},{65.3972,-28.7474,221.8518,83},{266.7132,-0.8388,180.6371,110}}},
    {31,"Carpenters_Landing",             2,{}},
    {32,"Uleguerand_Range",               5,{}},
    {33,"Attohwa_Chasm",                  7,{}},
    {34,"Oldton_Movalpolos",             11,{}},
    {35,"Newton_Movalpolos",             12,{}},
    {36,"Wajaom_Woodlands",              51,{}},
    {37,"Bhaflau_Thickets",              52,{}},
    {38,"Arrapago_Reef",                 54,{}},
    {39,"Mount_Zhayolm",                 61,{}},
    {40,"Halvung",                       62,{}},
    {41,"Mamook",                        65,{}},
    {42,"Aydeewa_Subterrane",            68,{}},
    {43,"Alzadaal_Undersea_Ruins",       72,{}},
    {44,"Nyzul_Isle",                    77,{}},
    {45,"Caedarva_Mire",                 79,{}},
    {46,"Yughott_Grotto",               142,{}},
    {47,"Fort_Ghelsba",                 141,{}},
    {48,"Palborough_Mines",             143,{}},
    {49,"Giddeus",                      145,{}},
    {50,"Beadeaux",                     147,{}},
    {51,"Davoi",                        149,{}},
    {52,"Monastic_Cavern",              150,{}},
    {53,"Castle_Oztroja",               151,{}},
    {54,"The_Boyahda_Tree",             153,{}},
    {55,"Lower_Delkfutts_Tower",        184,{}},
    {56,"Middle_Delkfutts_Tower",       157,{}},
    {57,"Upper_Delkfutts_Tower",        158,{}},
    {58,"Den_of_Rancor",                160,{}},
    {59,"Castle_Zvahl_Baileys",         161,{}},
    {60,"Castle_Zvahl_Keep",            162,{}},
    {61,"Ranguemont_Pass",              166,{}},
    {62,"Bostaunieux_Oubliette",        167,{}},
    {63,"Toraimarai_Canal",             169,{}},
    {64,"Zeruhn_Mines",                 172,{}},
    {65,"Korroloka_Tunnel",             173,{}},
    {66,"Kuftal_Tunnel",                174,{}},
    {67,"The_Eldieme_Necropolis",       195,{}},
    {68,"Sea_Serpent_Grotto",           176,{}},
    {69,"Dangruf_Wadi",                 191,{}},
    {70,"Inner_Horutoto_Ruins",         192,{}},
    {71,"Outer_Horutoto_Ruins",         194,{}},
    {72,"Ordelles_Caves",               193,{}},
    {73,"Gusgen_Mines",                 196,{}},
    {74,"Crawlers_Nest",                197,{}},
    {75,"Maze_of_Shakhrami",            198,{}},
    {76,"Garlaige_Citadel",             200,{}},
    {77,"FeiYin",                       204,{}},
    {78,"Ifrits_Cauldron",              205,{}},
    {79,"Quicksand_Caves",              208,{}},
    {80,"Gustav_Tunnel",                212,{}},
    {81,"Labyrinth_of_Onzozo",          213,{}},
    {82,"Dynamis-Bastok",               186,{}},
    {83,"Dynamis-San_dOria",            185,{}},
    {84,"Dynamis-Windurst",             187,{}},
    {85,"Dynamis-Jeuno",                188,{}},
    {86,"Dynamis-Beaucedine",           134,{}},
    {87,"Dynamis-Xarcabard",            135,{}},
    {88,"RuAun_Gardens",                130,{}},
    {89,"VeLugannon_Palace",            177,{}},
    {90,"The_Shrine_of_RuAvitau",       178,{}},
    {91,"AlTaieu",                       33,{}},
    {92,"Grand_Palace_of_HuXzoi",        34,{}},
    {93,"The_Garden_of_RuHmet",          35,{}},
    {94,"Lufaise_Meadows",               24,{}},
    {95,"Misareaux_Coast",               25,{}},
    {96,"Phomiuna_Aqueducts",            27,{}},
    {97,"Sacrarium",                     28,{}},
    {98,"Riverne_Site-A01",              30,{}},
    {99,"Riverne_Site-B01",              29,{}},
    {100,"Escha-ZiTah",                  288,{}},
    {101,"Escha-RuAun",                  289,{}}
}

for _, entry in pairs(treasurePositions) do
if entry[1] == 1 then -- TODO: Delete this line (for testing purposes, forces West Ronfaure)
    local questZoneNum         = entry[1]
    local questZoneName        = entry[2]
    local questZoneID          = entry[3]
    local positionsLength      = #(entry[4])
    local randChestNum = math.random(1,positionsLength)
    local positionX = entry[4][randChestNum][1]
    local positionY = entry[4][randChestNum][2]
    local positionZ = entry[4][randChestNum][3]
    local positionR = entry[4][randChestNum][4]

    --print(string.format("xi.zones.%s.Zone.onInitialize",questZoneName))
    --print(string.format("Chest: x-pos %d, y-pos %d, z-pos %d, rot %d",positionX,positionY,positionZ,positionR))

    m:addOverride(string.format("xi.zones.%s.Zone.onInitialize",questZoneName), function(zone)

        super(zone)

        local dailyQuestChest = zone:insertDynamicEntity({

            objtype = xi.objType.NPC,
            name = "Secret Chest",
            look = treasureCostumeID,
            x = positionX,
            y = positionY,
            z = positionZ,
            rotation = positionR,
            widescan = 0,

            onTrade = function(player, npc, trade)
                player:PrintToPlayer("I don't require any items from you.", 0, npc:getPacketName())
            end,
    
            onTrigger = function(player, npc)
                handleMidnight(player)
                local dailyQuestActive = player:getCharVar("[DailyQuest]Fishstix")
                local dailyQuestZone = player:getCharVar("[DailyQuest]Fishstix_zone")
                local chestOpened = npc:getLocalVar("opened")

                if dailyQuestActive == 1 and dailyQuestZone == questZoneNum and chestOpened == 0 then
                    npc:setLocalVar("opened", 1)
                    player:setCharVar("[DailyQuest]Fishstix",2)
                    player:PrintToPlayer("You found the Secret Treasure Chest, please return to Fishstix to claim your reward!", 17)
                    npc:setAnimation(1)
                    npc:timer(3, function(npc)
                        npc:setStatus(xi.status.DISAPPEAR)
                        repeat
                            randChestNum = math.random(1,positionsLength)
                            newX = entry[4][randChestNum][1]
                            newY = entry[4][randChestNum][2]
                            newZ = entry[4][randChestNum][3]
                            newRot = entry[4][randChestNum][4]
                        until(math.abs(newX - npc:getXPos()) > 1 and math.abs(newZ - npc:getZPos()) > 1)
                        npc:setPos(newX, newY, newZ, newRot)
                        npc:setAnimation(0)
                        npc:setStatus(xi.status.NORMAL)
                        npc:setLocalVar("opened", 0)
                    end)
                else
                    player:PrintToPlayer("This is not for you.", 0, npc:getPacketName())    
                end
            end,
        })

        utils.unused(dailyQuestChest)
    end)
end -- TODO: Delete this line (for testing purposes, forces West Ronfaure)
end

return m
