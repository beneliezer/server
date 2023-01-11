-----------------------------------
-- func: dailyquest
-- desc: Handles moderation of daily quests
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!dailyquest <player> <check/reset> <all/npc name>")
end

function onTrigger(player, target, option, choice)
    -- validate target
    local targ
    if target == nil then
        error(player, "You must provide a player name.")
        return
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- validate option
    if option == nil then
        error(player, "You must select 'check' or 'reset'.")
        return
    end

    -- validate choice
    if choice == nil then
        error(player, "You must select 'all' or the npc's name.")
        return
    end

    if option == "check" then
        local fishstixStage = targ:getCharVar("[DailyQuest]Fishstix")
        local fishstixZone = targ:getCharVar("[DailyQuest]Fishstix_zone")
        local murdocStage = targ:getCharVar("[DailyQuest]Murdoc")
        local murdocZone = targ:getCharVar("[DailyQuest]Murdoc_zone")
        local murdocMobType = targ:getCharVar("[DailyQuest]Murdoc_mobType")
        local murdocKillAmt = targ:getCharVar("[DailyQuest]Murdoc_killAmt")
        local mistrixStage = targ:getCharVar("[DailyQuest]Mistrix")
        local mistrixItemID = targ:getCharVar("[DailyQuest]Mistrix_item")
        local saltlikStage = targ:getCharVar("[DailyQuest]Saltlik")
        local salklikZone = targ:getCharVar("[DailyQuest]Saltlik_zone")
        local salklikNM = targ:getCharVar("[DailyQuest]Saltlik_NM")
        local beetrixStage = targ:getCharVar("[DailyQuest]Beetrix")
        local beetrixZone = targ:getCharVar("[DailyQuest]Beetrix_zone")
        local beetrixRExItem = targ:getCharVar("[DailyQuest]Beetrix_RExItem")
        local completedDailyQuests = targ:getCharVar("[DailyQuest]Completed")
        if choice == "all" then
            player:PrintToPlayer(string.format("%s's [Completed]: %i.", targ:getName(), completedDailyQuests))
            player:PrintToPlayer(string.format("%s's [Fishstix] Active: %i, Zone: %i.", targ:getName(), fishstixStage, fishstixZone))
            player:PrintToPlayer(string.format("%s's [Murdoc] Active: %i, Zone: %i, Mob Type: %i, Kill Amt: %i.", targ:getName(), murdocStage, murdocZone, murdocMobType, murdocKillAmt))
            player:PrintToPlayer(string.format("%s's [Mistrix] Active: %i, Item ID: %i.", targ:getName(), mistrixStage, mistrixItemID))
            player:PrintToPlayer(string.format("%s's [Saltlik] Active: %i, Zone: %i, NM: %i.", targ:getName(), saltlikStage, salklikZone, salklikNM))
            player:PrintToPlayer(string.format("%s's [Beetrix] Active: %i, Zone: %i, Item ID: %i.", targ:getName(), beetrixStage, beetrixZone, beetrixRExItem))
        elseif choice == "fishstix" then
            player:PrintToPlayer(string.format("%s's [Fishstix] Active: %i, Zone: %i.", targ:getName(), fishstixStage, fishstixZone))
        elseif choice == "murdoc" then
            player:PrintToPlayer(string.format("%s's [Murdoc] Active: %i, Zone: %i, Mob Type: %i, Kill Amt: %i.", targ:getName(), murdocStage, murdocZone, murdocMobType, murdocKillAmt))
        elseif choice == "mistrix" then
            player:PrintToPlayer(string.format("%s's [Mistrix] Active: %i, Item ID: %i.", targ:getName(), mistrixStage, mistrixItemID))
        elseif choice == "saltlik" then
            player:PrintToPlayer(string.format("%s's [Saltlik] Active: %i, Zone: %i, NM: %i.", targ:getName(), saltlikStage, salklikZone, salklikNM))
        elseif choice == "beetrix" then
            player:PrintToPlayer(string.format("%s's [Beetrix] Active: %i, Zone: %i, Item ID: %i.", targ:getName(), beetrixStage, beetrixZone, beetrixRExItem))
        else
            error(player, "You must select 'all' or the npc's name.")
            return
        end
    elseif option == "reset" then
        if choice == "all" then
            local currentMidnight = getMidnight()
            targ:setCharVar("[DailyQuest]Midnight", currentMidnight)
            targ:setCharVar("[DailyQuest]Completed", 0)
            targ:setCharVar("[DailyQuest]Fishstix", 0)
            targ:setCharVar("[DailyQuest]Fishstix_zone", 0)
            targ:setCharVar("[DailyQuest]Murdoc", 0)
            targ:setCharVar("[DailyQuest]Murdoc_zone", 0)
            targ:setCharVar("[DailyQuest]Murdoc_mobType", 0)
            targ:setCharVar("[DailyQuest]Murdoc_killAmt", 0)
            targ:setCharVar("[DailyQuest]Mistrix", 0)
            targ:setCharVar("[DailyQuest]Mistrix_item", 0)
            targ:setCharVar("[DailyQuest]Saltlik", 0)
            targ:setCharVar("[DailyQuest]Saltlik_zone", 0)
            targ:setCharVar("[DailyQuest]Saltlik_NM", 0)
            targ:setCharVar("[DailyQuest]Beetrix", 0)
            targ:setCharVar("[DailyQuest]Beetrix_zone", 0)
            targ:setCharVar("[DailyQuest]Beetrix_RExItem", 0)
            player:PrintToPlayer(string.format("You have reset all of %s's daily quests.", targ:getName()))
        elseif choice == "fishstix" then
            targ:setCharVar("[DailyQuest]Fishstix", 0)
            targ:setCharVar("[DailyQuest]Fishstix_zone", 0)
            player:PrintToPlayer(string.format("You have reset %s's Fishstix daily quest.", targ:getName()))
        elseif choice == "murdoc" then
            targ:setCharVar("[DailyQuest]Murdoc", 0)
            targ:setCharVar("[DailyQuest]Murdoc_zone", 0)
            targ:setCharVar("[DailyQuest]Murdoc_mobType", 0)
            targ:setCharVar("[DailyQuest]Murdoc_killAmt", 0)
            player:PrintToPlayer(string.format("You have reset %s's Murdoc daily quest.", targ:getName()))
        elseif choice == "mistrix" then
            targ:setCharVar("[DailyQuest]Mistrix", 0)
            targ:setCharVar("[DailyQuest]Mistrix_item", 0)
            player:PrintToPlayer(string.format("You have reset %s's Mistrix daily quest.", targ:getName()))
        elseif choice == "saltlik" then
            targ:setCharVar("[DailyQuest]Saltlik", 0)
            targ:setCharVar("[DailyQuest]Saltlik_zone", 0)
            targ:setCharVar("[DailyQuest]Saltlik_NM", 0)
            player:PrintToPlayer(string.format("You have reset %s's Saltlik daily quest.", targ:getName()))
        elseif choice == "beetrix" then
            targ:setCharVar("[DailyQuest]Beetrix", 0)
            targ:setCharVar("[DailyQuest]Beetrix_zone", 0)
            targ:setCharVar("[DailyQuest]Beetrix_RExItem", 0)
            player:PrintToPlayer(string.format("You have reset %s's Beetrix daily quest.", targ:getName()))
        else
            error(player, "You must select 'all' or the npc's name.")
            return
        end
    else
        error(player, "You must select 'check' or 'reset'.")
        return
    end

end
