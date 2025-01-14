-----------------------------------
-- Area: Selbina
--  NPC: Zaldon
-- Involved in Quests: Under the sea, A Boy's Dream
-- Starts and Finishes: Inside the Belly
-- !pos -13 -7 -5 248
-----------------------------------
---@type TNpcEntity
local entity = {}

-- data from http://wiki.ffxiclopedia.org/wiki/Inside_the_Belly
local fishRewards =
{
    [xi.item.GRIMMONITE] = -- Grimmonite
    {
        gil = 350,
        items =
        {
            { chance = 5, itemId = xi.item.GOLD_RING }, -- guessing 5%. Wiki unknown
            { chance = 5, itemId = xi.item.MYTHRIL_RING }, -- guessing 5%. Wiki unknown
            { chance = 5, itemId = xi.item.SILVER_RING }, -- guessing 5%. Wiki unknown
        }
    },

    [xi.item.RYUGU_TITAN] =
    {
        gil = 800,
        items =
        {
            { chance = 1.3, itemId = xi.item.MERCURIAL_SWORD },
        }
    },

    [xi.item.GIANT_DONKO] =
    {
        gil = 96,
        items =
        {
            { chance = 4.7, itemId = xi.item.BROKEN_HALCYON_FISHING_ROD },
        }
    },

    [xi.item.JUNGLE_CATFISH] =
    {
        gil = 300,
        items =
        {
            { chance = 3, itemId = xi.item.BROKEN_HUME_FISHING_ROD },
        }
    },

    [xi.item.GIANT_CHIRAI] =
    {
        gil = 550,
        items =
        {
            { chance = 1.2, itemId = xi.item.SPOOL_OF_TWINTHREAD },
        }
    },

    [xi.item.CAVE_CHERAX] =
    {
        gil = 800,
        items =
        {
            { chance = 26.2, itemId = xi.item.DWARF_PUGIL },
        }
    },

    [xi.item.ARMORED_PISCES] =
    {
        gil = 475,
        items =
        {
            { chance = 0.4, itemId = xi.item.STOLID_BREASTPLATE },
        }
    },

    [xi.item.TRICORN] =
    {
        gil = 810,
        items =
        {
            { chance = 4, itemId = xi.item.CHUNK_OF_DARKSTEEL_ORE }, -- guessing 4%. Wiki unknown
        }
    },

    [xi.item.ZAFMLUG_BASS] =
    {
        gil = 15,
        items =
        {
            { chance = 1.4, itemId = xi.item.BLUE_ROCK },
        }
    },

    [xi.item.MONKE_ONKE] =
    {
        gil = 150,
        items =
        {
            { chance = 10, itemId = xi.item.PINCH_OF_POISON_DUST, min = 1, max = 6 }, -- guessing 10%. Wiki unknown
        }
    },

    [xi.item.DARK_BASS] =
    {
        gil = 10,
        items =
        {
            { chance = 4.6, itemId = xi.item.GREEN_ROCK },
        }
    },

    [xi.item.SILVER_SHARK] =
    {
        gil = 250,
        title = xi.title.ACE_ANGLER,
        items =
        {
            { chance = 1.4, itemId = xi.item.TRIDENT },
        }
    },

    [xi.item.EMPEROR_FISH] =
    {
        gil = 300,
        items =
        {
            { chance = 1, itemId = xi.item.CUIR_HIGHBOOTS }, -- guessing 1%. Wiki says 0%
        }
    },

    [xi.item.TAKITARO] =
    {
        gil = 350,
        items =
        {
            { chance = 2.4, itemId = xi.item.PHILOSOPHERS_STONE },
        }
    },

    [xi.item.BLADEFISH] =
    {
        gil = 200,
        items =
        {
            { chance = 11.7, itemId = xi.item.ROBBER_RIG },
        }
    },

    [xi.item.GIGANT_SQUID] =
    {
        gil = 300,
        items =
        {
            { chance = 2.5, itemId = xi.item.FLAME_SHIELD }, -- guessing 2.5%. Wiki unknown
        }
    },

    [xi.item.SEA_ZOMBIE] =
    {
        gil = 350,
        items =
        {
            { chance = 26.1, itemId = xi.item.DRILL_CALAMARY },
        }
    },

    [xi.item.TITANICTUS] =
    {
        gil = 350,
        title = xi.title.LU_SHANG_LIKE_FISHER_KING,
        items =
        {
            { chance = 1.3, itemId = xi.item.ANCIENT_SWORD },
            { chance =   5, itemId = xi.item.SEASHELL }, -- guessing 5%. Wiki unknown
        }
    },

    [xi.item.GAVIAL_FISH] =
    {
        gil = 250,
        items =
        {
            { chance = 4.9, itemId = xi.item.DRONE_EARRING },
        }
    },

    [xi.item.THREE_EYED_FISH] =
    {
        gil = 250,
        items =
        {
            { chance = 10, itemId = xi.item.PINCH_OF_PARALYSIS_DUST, min = 1, max = 10 }, -- guessing 10%. Wiki unknown
        }
    },

    [xi.item.BHEFHEL_MARLIN] =
    {
        gil = 150,
        items =
        {
            { chance = 14.3, itemId = xi.item.BRIGANDS_CHART },
            { chance =  4.4, itemId = xi.item.PIRATES_CHART },
        }
    },

    [xi.item.GUGRU_TUNA] =
    {
        gil = 50,
        items =
        {
            { chance = 2.5, itemId = xi.item.TINY_TATHLUM },
        }
    },

    [xi.item.OGRE_EEL] =
    {
        gil = 16,
        title = xi.title.CORDON_BLEU_FISHER,
        items =
        {
            { chance = 2.5, itemId = xi.item.TURQUOISE_RING },
        }
    },

    [xi.item.TITANIC_SAWFISH] =
    {
        gil = 810,
        items =
        {
            { chance = 0.7, itemId = xi.item.AIZENKUNITOSHI },
        }
    },

    [xi.item.GUGRUSAURUS] =
    {
        gil = 880,
        items =
        {
            { chance = 0.4, itemId = xi.item.SABER_SHOOT },
        }
    },

    [xi.item.LIK] =
    {
        gil = 880,
        items =
        {
            { chance = 0.5, itemId = xi.item.SPOOL_OF_OPAL_SILK },
        }
    },

    [xi.item.PTERYGOTUS] =
    {
        gil = 390,
        items =
        {
            { chance = 6.7, itemId = xi.item.LAPIS_LAZULI },
        }
    },

    [xi.item.MOLA_MOLA] =
    {
        gil = 487,
        items =
        {
            { chance = 1.8, itemId = xi.item.MERCURIAL_SPEAR },
        }
    },

    [xi.item.RHINOCHIMERA] =
    {
        gil = 300,
        items =
        {
            { chance = 3.2, itemId = xi.item.SOLON_TORQUE },
        }
    },

    [xi.item.ISTAVRIT] =
    {
        gil = 50,
        items =
        {
            { chance = 10, itemId = xi.item.PINCH_OF_VENOM_DUST, min = 1, max = 6 }, -- guessing 10%. Wiki unknown
        }
    },

    [xi.item.TURNABALIGI] =
    {
        gil = 340,
        items =
        {
            { chance =   1, itemId = xi.item.CHUNK_OF_DARK_ORE },
            { chance = 1.4, itemId = xi.item.CHUNK_OF_ICE_ORE },
            { chance = 1.4, itemId = xi.item.CHUNK_OF_WATER_ORE },
        }
    },

    [xi.item.KALKANBALIGI] =
    {
        gil = 390,
        items =
        {
            { chance = 3.3, itemId = xi.item.FLAT_SHIELD },
        }
    },

    [xi.item.VEYDAL_WRASSE] =
    {
        gil = 225,
        items =
        {
            { chance = 5, itemId = xi.item.NEBIMONITE }, -- guessing 5%. Wiki unknown
            { chance = 5, itemId = xi.item.SEASHELL }, -- guessing 5%. Wiki unknown
        }
    },

    [xi.item.LAKERDA] =
    {
        gil = 51,
        items =
        {
            { chance =   6, itemId = xi.item.PEARL },
            { chance = 1.9, itemId = xi.item.BLACK_PEARL },
        }
    },

    [xi.item.KILICBALIGI] =
    {
        gil = 150,
        items =
        {
            { chance = 2.5, itemId = xi.item.RUSTY_GREATSWORD }, -- guessing 2.5%. Wiki unknown
        }
    },

    [xi.item.AHTAPOT] =
    {
        gil = 350,
        items =
        {
            { chance = 18.5, itemId = xi.item.MILDEWY_INGOT },
            { chance = 10.2, itemId = xi.item.DECAYED_INGOT },
        }
    },

    [xi.item.MORINABALIGI] =
    {
        gil = 300,
        items =
        {
            { chance = 5, itemId = xi.item.CUIR_GLOVES }, -- guessing 5%. Wiki unknown
        }
    },

    [xi.item.YAYINBALIGI] =
    {
        gil = 50,
        items =
        {
            { chance = 5, itemId = xi.item.TELLURIC_RING }, -- guessing 5%. Wiki unknown
        }
    },

    [xi.item.MEGALODON] =
    {
        gil = 532,
        items =
        {
            { chance = 3, itemId = xi.item.BROKEN_MITHRAN_FISHING_ROD }, -- guessing 3%. Wiki unknown
            { chance = 3, itemId = xi.item.MITHRAN_FISHING_ROD }, -- guessing 3%. Wiki unknown
        }
    },

    [xi.item.MATSYA] =
    {
        gil = 12592,
        items =
        {
            { chance = 1.2, itemId = xi.item.SHAPERS_SHAWL },
        }
    },

    [xi.item.PIRARUCU] =
    {
        gil = 516,
        items =
        {
            { chance =   5, itemId = xi.item.WYVERN_SKIN }, -- guessing 5%. Wiki unknown
            { chance = 2.5, itemId = xi.item.PEISTE_SKIN }, -- guessing 2.5%. Wiki unknown
        }
    },

    [xi.item.GERROTHORAX] =
    {
        gil = 423,
        items =
        {
            { chance = 1.2, itemId = xi.item.RISKY_PATCH },
        }
    },

    [xi.item.GIGANT_OCTOPUS] =
    {
        gil = 119,
        items =
        {
            { chance = 10, itemId = xi.item.JAR_OF_BLACK_INK, min = 1, max = 6 }, --guessing 10%. Wiki unknown
        }
    },

    [xi.item.ABAIA] = -- Abaia
    {
        gil = 690,
        items =
        {
            { chance =  1.5, itemId = xi.item.AURORA_BASS, min = 1, max = 1 }, -- Aurora Bass x3
            { chance =  7.8, itemId = xi.item.AURORA_BASS, min = 2, max = 2 }, -- Aurora Bass x2
            { chance = 12.5, itemId = xi.item.AURORA_BASS, min = 3, max = 3 }, -- Aurora Bass x1
            { chance =  0.7, itemId = xi.item.PLUMB_BOOTS },
        }
    },

    [xi.item.SORYU] =
    {
        gil = 1512,
        items =
        {
            { chance = 46.8, itemId = xi.item.SORYUS_LIVER },
        }
    },

    [xi.item.SEKIRYU] =
    {
        gil = 1512,
        items =
        {
            { chance = 48.1, itemId = xi.item.SEKIRYUS_LIVER }, -- guessing 48.1%. Wiki unknown
        }
    },

    [xi.item.HAKURYU] =
    {
        gil = 1512,
        items =
        {
            { chance = 48.1, itemId = xi.item.HAKURYUS_LIVER },
        }
    },

    [xi.item.GIANT_CATFISH] =
    {
        gil = 50,
        title = xi.title.CORDON_BLEU_FISHER,
        items =
        {
            { chance = 6.2, itemId = xi.item.EARTH_WAND },
        }
    },

    [xi.item.DORADO_GAR] =
    {
        gil = 568,
        items =
        {
            { chance = 5, itemId = xi.item.GOLD_INGOT, min = 1, max = 4 }, -- guessing 5%. Wiki unknown
        }
    },

    [xi.item.CROCODILOS] =
    {
        gil = 1763,
        items =
        {
            { chance = 2.3, itemId = xi.item.PUFFIN_RING },
        }
    },

    [xi.item.PELAZOEA] =
    {
        gil = 360,
        items =
        {
            { chance = 1.8, itemId = xi.item.NODDY_RING },
        }
    },

    [xi.item.FAR_EAST_PUFFER] =
    {
        gil = 735,
        items =
        {
            { chance = 5, itemId = xi.item.STINKY_SUBLIGAR }, -- guessing 5%. Wiki unknown
        }
    },
}

local function tradeFish(player, fishId)
    player:setCharVar('insideBellyFishId', fishId)
    player:setCharVar('insideBellyItemIdx', 0)

    local rewards = fishRewards[fishId].items
    local roll    = math.random(1, 1000) / 10
    local found   = false
    local sum     = 0

    for i = 1, #rewards do
        sum = sum + rewards[i].chance
        if roll <= sum then
            found = true
            player:setCharVar('insideBellyItemIdx', i)

            -- NOTE: We confirm the trade now, and not at the end of the cutscene as normal
            --     : because the cutscene gives away whether or not the trade was successful
            --     : or not, and it's possible for players to cheese this trade by force-dc-ing.
            player:confirmTrade()
            player:startEvent(166, 0, rewards[i].itemId)
            break
        end
    end

    if not found then
        player:confirmTrade()
        player:startEvent(167)
    end
end

local function giveReward(player, csid)
    if csid == 166 or csid == 167 then
        local fishId  = player:getCharVar('insideBellyFishId')
        local itemIdx = player:getCharVar('insideBellyItemIdx')
        local reward  = fishRewards[fishId]
        local traded  = true

        if itemIdx > 0 then
            local r = reward.items[itemIdx]
            local itemId = r.itemId
            local itemQt = 1
            if r.min ~= nil and r.max ~= nil then
                itemQt = math.random(r.min, r.max)
            end

            if not npcUtil.giveItem(player, { { itemId, itemQt } }) then
                traded = false
            end
        end

        if traded then
            npcUtil.giveCurrency(player, 'gil', reward.gil)
            player:setCharVar('insideBellyFishId', 0)
            player:setCharVar('insideBellyItemIdx', 0)
            if player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.INSIDE_THE_BELLY) == xi.questStatus.QUEST_ACCEPTED then
                player:completeQuest(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.INSIDE_THE_BELLY)
            end

            if reward.title ~= nil then
                player:addTitle(reward.title)
            end
        end
    end
end

entity.onTrade = function(player, npc, trade)
    local insideTheBelly = player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.INSIDE_THE_BELLY)

    -- A BOY'S DREAM
    if
        player:getCharVar('aBoysDreamCS') == 5 and
        npcUtil.tradeHasExactly(trade, xi.item.ODONTOTYRANNUS)
    then
        player:startEvent(85)

    -- INSIDE THE BELLY
    elseif
        insideTheBelly == xi.questStatus.QUEST_ACCEPTED or
        insideTheBelly == xi.questStatus.QUEST_COMPLETED
    then
        for fish, v in pairs(fishRewards) do
            if npcUtil.tradeHas(trade, fish) then
                tradeFish(player, fish)
                break
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    -- TODO: once fishing skill is implemented, replace all these mLvl checks with player:getSkillLevel(xi.skill.FISHING)

    local theRealGift    = player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_REAL_GIFT)
    local insideTheBelly = player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.INSIDE_THE_BELLY)
    local mLvl           = player:getMainLvl()

    -- INSIDE THE BELLY
    if
        mLvl >= 30 and
        theRealGift == xi.questStatus.QUEST_COMPLETED and
        insideTheBelly == xi.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(161)
    elseif
        mLvl >= 30 and
        mLvl < 39 and
        (insideTheBelly == xi.questStatus.QUEST_ACCEPTED or insideTheBelly == xi.questStatus.QUEST_COMPLETED)
    then
        player:startEvent(162, 5799, 4481, 5802, 4428)
    elseif
        mLvl >= 40 and
        mLvl < 49 and
        (insideTheBelly == xi.questStatus.QUEST_ACCEPTED or insideTheBelly == xi.questStatus.QUEST_COMPLETED)
    then
        player:startEvent(163, 5805, 4385, 5800, 5802, 5450) -- 5802(Istavrit) is skill cap 41, and therefore is used in this and the previous csid
    elseif
        mLvl >= 50 and
        mLvl <= 74 and
        (insideTheBelly == xi.questStatus.QUEST_ACCEPTED or insideTheBelly == xi.questStatus.QUEST_COMPLETED)
    then
        player:startEvent(164, 5806, 5451, 5801, 5804, 5807, 5135)
    elseif
        mLvl >= 75 and
        (insideTheBelly == xi.questStatus.QUEST_ACCEPTED or insideTheBelly == xi.questStatus.QUEST_COMPLETED)
    then
        player:startEvent(165, 4451, 4477, 5803, 4307, 4478, 5467, 4304, 4474)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    -- A BOY'S DREAM
    if csid == 85 then
        npcUtil.giveKeyItem(player, xi.ki.KNIGHTS_BOOTS)
        player:setCharVar('aBoysDreamCS', 6)
        player:confirmTrade()

    -- INSIDE THE BELLY
    elseif csid == 161 then
        player:addQuest(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.INSIDE_THE_BELLY)
    elseif csid == 166 or csid == 167 then
        giveReward(player, csid)
    end
end

return entity
