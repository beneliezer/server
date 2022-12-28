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

local treasureCostumeID = 267
local treasurePositions =
{
    -- Zone Num | Zone Name | Zone ID | POS Locations
    {1,"West_Ronfaure",                100,{{-29,-60,219,87},{-178,-60,317,128},{-547.2,-59.6,517.5,158},{-483.5,-46.7,226.7,8},{-236,-40,63,243},{-294.65,-32.33,-26.1,132},{-454.77,-32.33,14.25,121},{-614.63,-24.57,-151.53,242},{-521.7,0,-438.05,166},{-289.07,0.5,-521.45,97},{-181.4,0,-501.3,98},{-68.55,-0.16,-538.55,193},{-50.54,-9.5,-398.48,0}}},
    {2,"East_Ronfaure",                101,{}},
    {3,"South_Gustaberg",              107,{}},
    {4,"North_Gustaberg",              106,{}},
    {5,"West_Sarutabaruta",            115,{}},
    {6,"East_Sarutabaruta",            116,{}},
    {7,"La_Theine_Plateau",            102,{}},
    {8,"Konschtat_Highlands",          108,{}},
    {9,"Tahrongi_Canyon",              117,{}},
    {10,"Valkurm_Dunes",                103,{}},
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
    {26,"Yhoator_Jungle",               124,{}},
    {27,"Qufim_Island",                 126,{}},
    {28,"Temple_of_Uggalepih",          159,{}},
    {29,"Valley_of_Sorrows",            128,{}},
    {30,"Bibiki_Bay",                     4,{}},
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
                    npc:timer(3000, function(npc)
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
