-----------------------------------
-- Daily Quest : Gronk
-- Daily Quest Reward NPC
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/zone")
require("scripts/zones/Lower_Jeuno/Zone")
local ID = require("scripts/zones/Lower_Jeuno/IDs")
-----------------------------------
local m = Module:new("daily_quest_gronk")

local maxItemsPerPage = 3

local rewardList = 
{
    --Bayld Cost | Item ID | Item Name
    {100,16148,"Cobra Cap"},
    {200,14590,"Cobra Harness"},
    {300,15011,"Cobra Mittens"},
    {400,16317,"Cobra Subligar"},
    {500,15757,"Cobra Leggings"},
    {600,16143,"Cobra Hat"},
    {700,14591,"Cobra Robe"},
    {800,15012,"Cobra Gloves"},
    {900,16318,"Cobra Trews"},
    {1000,15758,"Cobra Crackows"},
    {1100,16147,"Fourth Haube"},
    {1200,14589,"Fourth Brunne"},
    {1300,15010,"Fourth Hentzes"},
    {1400,16316,"Fourth Schoss"},
    {1500,15756,"Fourth Schuhs"},
    {1600,16146,"Iron Ram Sallet"},
    {1700,14588,"Iron Ram Hauberk"},
    {1800,15009,"Iron Ram Dastanas"},
    {1800,16315,"Iron Ram Hose"},
    {1800,15755,"Iron Ram Greaves"},
    {3000,16062,"Amir Puggaree"},
    {3000,14525,"Amir Korazin"},
    {3500,14933,"Amir Kolluks"},
    {3500,15604,"Amir Dirs"},
    {4000,15688,"Amir Boots"},
    {6000,16069,"Pahluwan Qalansuwa"},
    {6500,14530,"Pahluwan Khazagand"},
    {6700,14940,"Pahluwan Dastanas"},
    {6700,15609,"Pahluwan Seraweels"},
    {6900,15695,"Pahluwan Crackows"},
    {10000,16064,"Yigit Turban"},
    {11000,14527,"Yigit Gomlek"},
    {15000,14935,"Yigit Gages"},
    {20000,15606,"Yigit Seraweels"},
    {20000,15690,"Yigit Crackows"},
    {50000,16106,"Askar Zucchetto"},
    {100000,14568,"Askar Korazin"},
    {100000,14983,"Askar Manopolas"},
    {100000,15647,"Askar Dirs"},
    {100000,15733,"Askar Gambieras"},
    {100000,16107,"Denali Bonnet"},
    {100000,14569,"Denali Jacket"},
    {100000,14984,"Denali Wristbands"},
    {100000,15648,"Denali Kecks"},
    {100000,15734,"Denali Gamashes"},
    {100000,16108,"Goliard Chapeau"},
    {100000,14570,"Goliard Saio"},
    {100000,14985,"Goliard Cuffs"},
    {100000,15649,"Goliard Trews"},
    {100000,15735,"Goliard Clogs"},
    {100000,15840,"Kupofried's Ring"},
    {100000,14470,"Assault Breastplate"}
}

local tier1Rewards = {}
local tier2Rewards = {}
local tier3Rewards = {}
local tier4Rewards = {}
local tier5Rewards = {}

local menu =
{
    title = "Choose a Reward Tier",
    options = {}
}

local tableContains = function(thisTable, value)
    local found = false
    if next(thisTable) ~= nil then
        for i = 1, table.getn(thisTable) do
            if thisTable[i] == value then
                found = true
            end
        end
    end
    return found
end

local sortTiers = function()
    for tierNum = 1, 5 do
        local values = {}
        local selTier = {}
        local sortedTier = {}
        if tierNum == 1 then
            selTier = tier1Rewards
        elseif tierNum == 2 then
            selTier = tier2Rewards
        elseif tierNum == 3 then
            selTier = tier3Rewards
        elseif tierNum == 4 then
            selTier = tier4Rewards
        elseif tierNum == 5 then
            selTier = tier5Rewards
        end

        for i = 1, table.getn(selTier) do
            local value = selTier[i][1]
            if tableContains(values, value) == false then
                table.insert(values, value)
            end
        end

        table.sort(values)

        for i = 1, table.getn(values) do
            local nextVal = values[i]
            for j = 1, table.getn(selTier) do
                local val = selTier[j][1]
                if val == nextVal then
                    table.insert(sortedTier,{selTier[j][1],selTier[j][2],selTier[j][3]})
                end
            end
        end

        if tierNum == 1 then
            tier1Rewards = sortedTier
        elseif tierNum == 2 then
            tier2Rewards = sortedTier
        elseif tierNum == 3 then
            tier3Rewards = sortedTier
        elseif tierNum == 4 then
            tier4Rewards = sortedTier
        elseif tierNum == 5 then
            tier5Rewards = sortedTier
        end
    end
end

local sortRewards = function()
    for _, entry in pairs(rewardList) do
        local itemCost = entry[1]
        if itemCost < 1000 then
            table.insert(tier1Rewards,{itemCost,entry[2],entry[3]})
        elseif itemCost >= 1000 and itemCost < 2500 then
            table.insert(tier2Rewards,{itemCost,entry[2],entry[3]})
        elseif itemCost >= 2500 and itemCost < 5000 then
            table.insert(tier3Rewards,{itemCost,entry[2],entry[3]})
        elseif itemCost >= 5000 and itemCost < 10000 then
            table.insert(tier4Rewards,{itemCost,entry[2],entry[3]})
        elseif itemCost >= 10000 then
            table.insert(tier5Rewards,{itemCost,entry[2],entry[3]})
        end
    end
    sortTiers()
end

local delaySendMenu = function(player, page)
    player:timer(100, function(playerArg)
        playerArg:customMenu(page)
    end)
end

local buildMenu

-- Complete Transaction Yes/No
local completeTransaction = function(player, npc, tierNum, valueIndex)
    local bayldBalance  = player:getCurrency('bayld')
    local selectedTier
    if tierNum == 1 then
        selectedTier = tier1Rewards
    elseif tierNum == 2 then
        selectedTier = tier2Rewards
    elseif tierNum == 3 then
        selectedTier = tier3Rewards
    elseif tierNum == 4 then
        selectedTier = tier4Rewards
    elseif tierNum == 5 then
        selectedTier = tier5Rewards
    end
    choiceName = selectedTier[valueIndex][3]
    choiceItemID = selectedTier[valueIndex][2]
    choiceCost = selectedTier[valueIndex][1]
    
    -- Confirmation menu
    local confirmMenu  =
    {
        title = string.format("Buy %s (%i bayld)?", choiceName, choiceCost),

        onStart = function(playerArg)
        end,

        options =
        {
            {
                "Yes, I'm sure!",
                function(playerArg)
                    -- Make sure players don't already have item
                    if player:hasItem(choiceItemID) then
                        player:PrintToPlayer("You have already have that item!", 0, npc:getPacketName())
                        player:timer(50, function(playerArg)
                            local pageToDisplay = buildMenu(player, npc, selectedTier, math.ceil(valueIndex / maxItemsPerPage))
                            delaySendMenu(player, pageToDisplay)
                        end)
                    else
                        if bayldBalance >= choiceCost and choiceItemID ~= nil then
                            if npcUtil.giveItem(player, choiceItemID) then
                                player:setCurrency("bayld", bayldBalance - choiceCost)
                            end
                        end
                    end
                end,
            },
            {
                "No, I change my mind.",
                function(playerArg)
                    player:timer(50, function(playerArg)
                        local pageToDisplay = buildMenu(player, npc, selectedTier, math.ceil(valueIndex / maxItemsPerPage))
                        delaySendMenu(player, pageToDisplay)
                    end)
                end
            },
        },
        
        onCancelled = function(playerArg)
        end,

        onEnd = function(playerArg)
        end,
    }

    if choiceCost <= bayldBalance then
        player:customMenu(confirmMenu)
    else
        player:PrintToPlayer(string.format("You don't have enough bayld for this purchase."), 0, npc:getPacketName())
        local pageToDisplay = buildMenu(player, npc, selectedTier, math.ceil(valueIndex / maxItemsPerPage))
        delaySendMenu(player, pageToDisplay)
    end
end

buildMenu = function(player, npc, selectedTier, pageNum)
    local tierNum = 0
    if selectedTier == tier1Rewards then
        tierNum = 1
    elseif selectedTier == tier2Rewards then
        tierNum = 2
    elseif selectedTier == tier3Rewards then
        tierNum = 3
    elseif selectedTier == tier4Rewards then
        tierNum = 4
    elseif selectedTier == tier5Rewards then
        tierNum = 5
    end
    local tempPage = {
        title = string.format("Tier %i, Page %i",tierNum, pageNum),
        options = {}
    }
    local sizeOfTier = table.getn(selectedTier)
    local pagesOfTier = math.floor(sizeOfTier / maxItemsPerPage)
    local lastPage = math.fmod(sizeOfTier,maxItemsPerPage)
    if sizeOfTier > maxItemsPerPage and lastPage ~= 0 then
        pagesOfTier = pagesOfTier + 1
    end

    if pageNum == 1 then -- first page (Next only)
        if sizeOfTier <= maxItemsPerPage then
            for i = 1, sizeOfTier do
                table.insert(tempPage.options, {
                    string.format("%i: %s",selectedTier[i][1],selectedTier[i][3]),
                    function(playerArg)
                        player:timer(50, function(playerArg)
                            completeTransaction(player, npc, tierNum, i)
                        end)
                    end
                })
            end
        else
            for i = 1, maxItemsPerPage do
                table.insert(tempPage.options, {
                    string.format("%i: %s",selectedTier[i][1],selectedTier[i][3]),
                    function(playerArg)
                        player:timer(50, function(playerArg)
                            completeTransaction(player, npc, tierNum, i)
                        end)
                    end
                })
            end
            table.insert(tempPage.options, {
                "Next",
                function(playerArg)
                    player:timer(50, function(playerArg)
                        local pageToDisplay = buildMenu(player, npc, selectedTier, pageNum + 1)
                        delaySendMenu(player, pageToDisplay)
                    end)
                end
            })
        end
    elseif pageNum ~= 1 and pageNum == pagesOfTier then -- last page (Previous only)
        local startingItem = (pageNum * maxItemsPerPage) - (maxItemsPerPage - 1)
        local endingItem = sizeOfTier

        for i = startingItem, endingItem do
            table.insert(tempPage.options, {
                string.format("%i: %s",selectedTier[i][1],selectedTier[i][3]),
                function(playerArg)
                    player:timer(50, function(playerArg)
                        completeTransaction(player, npc, tierNum, i)
                    end)
                end
            })
        end
        table.insert(tempPage.options, {
            "Previous",
            function(playerArg)
                player:timer(50, function(playerArg)
                    local pageToDisplay = buildMenu(player, npc, selectedTier, pageNum - 1)
                    delaySendMenu(player, pageToDisplay)
                end)
            end
        })
    else -- middle pages (has Next and Previous)
        local startingItem = (pageNum * maxItemsPerPage) - (maxItemsPerPage - 1)
        local endingItem = pageNum * maxItemsPerPage

        for i = startingItem, endingItem do
            table.insert(tempPage.options, {
                string.format("%i: %s",selectedTier[i][1],selectedTier[i][3]),
                function(playerArg)
                    player:timer(50, function(playerArg)
                        completeTransaction(player, npc, tierNum, i)
                    end)
                end
            })
        end
        table.insert(tempPage.options, {
            "Next",
            function(playerArg)
                player:timer(50, function(playerArg)
                    local pageToDisplay = buildMenu(player, npc, selectedTier, pageNum + 1)
                    delaySendMenu(player, pageToDisplay)
                end)
            end
        })
        table.insert(tempPage.options, {
            "Previous",
            function(playerArg)
                player:timer(50, function(playerArg)
                    local pageToDisplay = buildMenu(player, npc, selectedTier, pageNum - 1)
                    delaySendMenu(player, pageToDisplay)
                end)
            end
        })
    end
    -- Add Main Menu link to each page
    table.insert(tempPage.options, {
        "Main Menu",
        function(playerArg)
            player:timer(50, function(playerArg)
                delaySendMenu(player, menu)
            end)
        end
    })

    return tempPage
end

local buildMainMenu = function(player, npc)
    menu =
    {
        title = "Choose a Reward Tier",
        options = {
            {
                "[1]     1 -  999 Bayld",
                function(playerArg)
                    player:timer(100, function(playerArg)
                        local pageToDisplay = buildMenu(player, npc, tier1Rewards, 1)
                        delaySendMenu(player, pageToDisplay)
                    end)
                end,
            },
            {
                "[2] 1000 - 2499 Bayld",
                function(playerArg)
                    player:timer(100, function(playerArg)
                        local pageToDisplay = buildMenu(player, npc, tier2Rewards, 1)
                        delaySendMenu(player, pageToDisplay)
                    end)
                end,
            },
            {
                "[3] 2500 - 4999 Bayld",
                function(playerArg)
                    player:timer(100, function(playerArg)
                        local pageToDisplay = buildMenu(player, npc, tier3Rewards, 1)
                        delaySendMenu(player, pageToDisplay)
                    end)
                end,
            },
            {
                "[4] 5000 - 9999 Bayld",
                function(playerArg)
                    player:timer(100, function(playerArg)
                        local pageToDisplay = buildMenu(player, npc, tier4Rewards, 1)
                        delaySendMenu(player, pageToDisplay)
                    end)
                end,
            },
            {
                "[5] 10000+ Bayld",
                function(playerArg)
                    player:timer(100, function(playerArg)
                        local pageToDisplay = buildMenu(player, npc, tier5Rewards, 1)
                        delaySendMenu(player, pageToDisplay)
                    end)
                end,
            },
            {
                "None",
                function(playerArg)
                    return
                end,
            },
        },
    }
end

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)
    sortRewards()

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
            local bayldBalance  = player:getCurrency('bayld')
            
            player:PrintToPlayer(string.format("You have %s bayld available to spend. Choose wisely.", bayldBalance), 0, npc:getPacketName())
            
            buildMainMenu(player, npc)
            
            delaySendMenu(player, menu)
        end,
    })

    utils.unused(gronk)
end)

return m
