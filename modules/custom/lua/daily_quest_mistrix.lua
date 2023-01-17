-----------------------------------
-- Daily Quest : Mistrix
-- Craft up a certain signed item
-----------------------------------
require("modules/module_utils")
require("scripts/globals/zone")
require("scripts/zones/Lower_Jeuno/Zone")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("daily_quest_mistrix")

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)

    local craftItems = {
        -- [index] | Item Name | Item ID
        -- Cooking
        [1] = {"Salted Hare",           5737},
        [2] = {"Pebble Soup",           4455},
        [3] = {"Roast Mutton",          4437},
        [4] = {"Pea Soup",              4416},
        [5] = {"Vegetable Gruel",       4489},
        [6] = {"Puls",                  4492},
        [7] = {"Menemen",               5586},
        [8] = {"Maple Cake",            5625},
        [9] = {"Windurst Salad",        4555},
        [10] = {"Jack-o'-Lantern",      4488},
        [11] = {"Icecap Rolanberry",    4556},
        [12] = {"Orange Tank",          16223},
        [13] = {"Bavarois",             5729},
        [14] = {"Tomato Soup",          4420},
        [15] = {"Mont Blanc",           5557},
        [16] = {"Goblin Stir-Fry",      5143},
        [17] = {"Ic Pilav",             5584},
        [18] = {"Bison Steak",          5142},
        [19] = {"Pepperoni Pizza",      5697},
        [20] = {"Pumpkin Soup",         4430},
        -- Alchemy
        [21] = {"Enchanted Ink",        2774},
        [22] = {"Water Tank",           13683},
        [23] = {"Silence Dagger",       16495},
        [24] = {"Poison Dagger",        16496},
        [25] = {"Ether Tank",           13682},
        [26] = {"Flame Degen",          16522},
        [27] = {"Hushed Baghnakhs",     18355},
        [28] = {"Mokuto",               16906},
        [29] = {"Seito",                17797},
        [30] = {"Saber",                16568},
        [31] = {"Blind Dagger",         16454},
        [32] = {"Poison Baghnakhs",     16410},
        [33] = {"Inferno Sword",        16594},
        [34] = {"Inferno Axe",          16709},
        [35] = {"Potion Tank",          13684},
        [36] = {"Vulcan Claymore",      18379},
        [37] = {"Melt Knife",           18011},
        [38] = {"Holy Mace",            17041},
        [39] = {"Sacred Sword",         17682},
        [40] = {"Acid Kukri",           16479},
        -- Bonecraft
        [41] = {"Bone Hairpin",         12505},
        [42] = {"Manashell Ring",       15782},
        [43] = {"Bone Ring",            13441},
        [44] = {"Bone Axe",             16642},
        [45] = {"Beetle Ring",          13457},
        [46] = {"Beetle Earring",       13323},
        [47] = {"Horn Hairpin",         12507},
        [48] = {"Beetle Mask",          12455},
        [49] = {"Horn Ring",            13459},
        [50] = {"Bone Cudgel",          17026},
        [51] = {"Bone Knife",           17610},
        [52] = {"Mist Crown",           15162},
        [53] = {"Carapace Mask",        13711},
        [54] = {"Horn",                 17352},
        [55] = {"Thunder Mittens",      14987},
        [56] = {"Bone Rod",             17062},
        [57] = {"Shock Subligar",       15650},
        [58] = {"Shell Hairpin",        12506},
        [59] = {"Stone Bangles",        14988},
        [60] = {"Bone Patas",           16420},
        -- Clothcraft
        [61] = {"Headgear",             12464},
        [62] = {"Cape",                 13583},
        [63] = {"Vagabond's Hose",      14290},
        [64] = {"Cuffs",                12728},
        [65] = {"Mitts",                12736},
        [66] = {"Slacks",               12864},
        [67] = {"Robe",                 12600},
        [68] = {"Trader's Saio",        14446},
        [69] = {"Cotton Headband",      12498},
        [70] = {"Fisherman's Tunica",   13808},
        [71] = {"Bracers",              12722},
        [72] = {"Linen Mitts",          12738},
        [73] = {"Mana Cloak",           14491},
        [74] = {"Mohbwa Sash",          15905},
        [75] = {"Mohbwa Scarf",         16261},
        [76] = {"Wool Hose",            12851},
        [77] = {"Black Mitts",          12739},
        [78] = {"White Mitts",          12737},
        [79] = {"Wool Doublet",         13752},
        [80] = {"Silk Coat",            12604},
        -- Goldsmithing
        [81] = {"Copper Ring",          13454},
        [82] = {"Brass Cap",            12449},
        [83] = {"Brass Knuckles",       16391},
        [84] = {"Brass Ring",           13465},
        [85] = {"Brass Xiphos",         16531},
        [86] = {"Tourmaline Earring",   13330},
        [87] = {"Poet's Circlet",       12473},
        [88] = {"Brass Hammer",         17043},
        [89] = {"Opal Earring",         13337},
        [90] = {"Brass Mask",           12433},
        [91] = {"Silver Ring",          13456},
        [92] = {"Chain Gorget",         13082},
        [93] = {"Mythril Ring",         13446},
        [94] = {"Mythril Baselard",     16456},
        [95] = {"Peridot Earring",      13319},
        [96] = {"Mufflers",             12682},
        [97] = {"Buckler",              12301},
        [98] = {"Green Earring",        13343},
        [99] = {"Mythril Gorget",       13084},
        [100] = {"Mythril Breastplate", 12545},
        -- Leathercraft
        [101] = {"Vagabond's Gloves",   14068},
        [102] = {"Leather Vest",        12568},
        [103] = {"Chocobo Gloves",      14072},
        [104] = {"Lizard Cesti",        16386},
        [105] = {"Warrior's Belt",      13194},
        [106] = {"Studded Trousers",    12826},
        [107] = {"Leather Ring",        13469},
        [108] = {"Wolf Mantle",         13571},
        [109] = {"Sandals",             12993},
        [110] = {"Magic Belt",          13195},
        [111] = {"Shoes",               12994},
        [112] = {"Corsette",            13271},
        [113] = {"Mist Pumps",          15312},
        [114] = {"Tough Belt",          15864},
        [115] = {"Powder Boots",        15320},
        [116] = {"Smiloden Ring",       15836},
        [117] = {"Himantes",            16388},
        [118] = {"Crow Gaiters",        15663},
        [119] = {"Raptor Jerkin",       12572},
        [120] = {"Beak Jerkin",         13699},
        -- Smithing
        [121] = {"Bronze Cap",          12448},
        [122] = {"Bronze Sword",        16535},
        [123] = {"Bronze Mace",         17034},
        [124] = {"Aspis",               12299},
        [125] = {"Mace",                17035},
        [126] = {"Debahocho",           21923},
        [127] = {"Iron Visor",          13871},
        [128] = {"Bilbo",               16512},
        [129] = {"Rod",                 17060},
        [130] = {"Mythril Knife",       16467},
        [131] = {"Mythril Kukri",       16475},
        [132] = {"Windurstian Kukri",   17978},
        [133] = {"Mythril Mace",        17036},
        [134] = {"Falchion",            16558},
        [135] = {"Lucent Axe",          18481},
        [136] = {"Mythril Rod",         17061},
        [137] = {"Gust Claymore",       18366},
        [138] = {"Patas",               16419},
        [139] = {"Steel Greaves",       14120},
        [140] = {"Nodowa",              13111},
        -- Woodworking
        [141] = {"Flute",               17345},
        [142] = {"Ash Staff",           17088},
        [143] = {"Willow Fishing Rod",  17391},
        [144] = {"Boomerang",           17280},
        [145] = {"Piccolo",             17347},
        [146] = {"Chestnut Club",       17025},
        [147] = {"Harp",                17354},
        [148] = {"Chestnut Sabots",     12986},
        [149] = {"High Mana Wand",      18403},
        [150] = {"Traversiere",         17348},
        [151] = {"Oak Cudgel",          17027},
        [152] = {"Warp Cudgel",         17040},
        [153] = {"Elm Pole",            17097},
        [154] = {"Rose Wand",           17053},
        [155] = {"Passaddhi Staff",     18606},
        [156] = {"Rose Harp",           17355},
        [157] = {"Oak Pole",            17098},
        [158] = {"Kaman",               17156},
        [159] = {"Ebony Wand",          17054},
        [160] = {"Mahogany Pole",       17099}
        -- Fishing??
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

    local mistrix = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Mistrix",
        look = 493,
        x = -52.7539,
        y = 0.000,
        z = -60.3718,
        rotation = 246,
        widescan = 1,

        onTrade = function(player, npc, trade)
            handleMidnight(player)
            local questStage = player:getCharVar("[DQ]Mistrix")
            local completedDailyQuests = player:getCharVar("[DQ]Completed")

            -- handle quest stages
            if questStage == 1 then
                local questItem = player:getCharVar("[DQ]Mistrix_I")
                local questCraftItemName = craftItems[questItem][1]
                local questCraftItemID = craftItems[questItem][2]
                local signed  = trade:getItem():getSignature() == player:getName() and 1 or 0
                if npcUtil.tradeHasExactly(trade, questCraftItemID) then
                    if signed ~= 0 then
                        player:tradeComplete()
                        player:setCharVar("[DQ]Mistrix",2)
                        player:setCharVar("[DQ]Completed",completedDailyQuests + 1)
                        player:PrintToPlayer("Congratulations! You've completed my quest for today, here's your reward!", 0, npc:getPacketName())
                        player:addCurrency('bayld', 300)
                        player:PrintToPlayer("You have obtained 300 bayld!", 17)
                        return
                    else
                        player:PrintToPlayer(string.format("I said I need a SIGNED %s, please use a HQ crystal and try again!",questCraftItemName), 0, npc:getPacketName())
                        return
                    end
                else
                    player:PrintToPlayer(string.format("I said I need a signed %s, and only a signed %s, please try again!",string.upper(questCraftItemName),string.upper(questCraftItemName)), 0, npc:getPacketName())
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
            local questStage = player:getCharVar("[DQ]Mistrix")
            
            -- handle quest stages
            if questStage == 0 then
                local randNum = math.random(1,160)
                local questCraftItemName = craftItems[randNum][1]
                player:setCharVar("[DQ]Mistrix",1)
                player:setCharVar("[DQ]Mistrix_I",randNum)
                player:PrintToPlayer(string.format("Craft me up a signed %s and trade it to me!",questCraftItemName), 0, npc:getPacketName())
                return
            elseif questStage == 1 then
                local questItem = player:getCharVar("[DQ]Mistrix_I")
                local questCraftItemName = craftItems[questItem][1]
                player:PrintToPlayer(string.format("Craft me up a signed %s and trade it to me!",questCraftItemName), 0, npc:getPacketName())
                return
            elseif questStage == 2 then
                player:PrintToPlayer("You've already completed this quest today! Come back tomorrow for more.", 0, npc:getPacketName())
                return
            end
        end,
    })

    utils.unused(mistrix)

end)

return m
