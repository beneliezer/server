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
        local fishstixStage = targ:getCharVar("[DQ]Fishstix")
        local fishstixZone = targ:getCharVar("[DQ]Fishstix_Z")
        local murdocStage = targ:getCharVar("[DQ]Murdoc")
        local murdocZone = targ:getCharVar("[DQ]Murdoc_Z")
        local murdocMobType = targ:getCharVar("[DQ]Murdoc_MT")
        local murdocKillAmt = targ:getCharVar("[DQ]Murdoc_KA")
        local mistrixStage = targ:getCharVar("[DQ]Mistrix")
        local mistrixItemID = targ:getCharVar("[DQ]Mistrix_I")
        local saltlikStage = targ:getCharVar("[DQ]Saltlik")
        local salklikZone = targ:getCharVar("[DQ]Saltlik_Z")
        local salklikNM = targ:getCharVar("[DQ]Saltlik_NM")
        local beetrixStage = targ:getCharVar("[DQ]Beetrix")
        local beetrixZone = targ:getCharVar("[DQ]Beetrix_Z")
        local beetrixRExItem = targ:getCharVar("[DQ]Beetrix_RE")
        local completedDailyQuests = targ:getCharVar("[DQ]Completed")
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
            targ:setCharVar("[DQ]Midnight", currentMidnight)
            targ:setCharVar("[DQ]Completed", 0)
            targ:setCharVar("[DQ]Fishstix", 0)
            targ:setCharVar("[DQ]Fishstix_Z", 0)
            targ:setCharVar("[DQ]Murdoc", 0)
            targ:setCharVar("[DQ]Murdoc_Z", 0)
            targ:setCharVar("[DQ]Murdoc_MT", 0)
            targ:setCharVar("[DQ]Murdoc_KA", 0)
            targ:setCharVar("[DQ]Mistrix", 0)
            targ:setCharVar("[DQ]Mistrix_I", 0)
            targ:setCharVar("[DQ]Saltlik", 0)
            targ:setCharVar("[DQ]Saltlik_Z", 0)
            targ:setCharVar("[DQ]Saltlik_NM", 0)
            targ:setCharVar("[DQ]Beetrix", 0)
            targ:setCharVar("[DQ]Beetrix_Z", 0)
            targ:setCharVar("[DQ]Beetrix_RE", 0)
            player:PrintToPlayer(string.format("You have reset all of %s's daily quests.", targ:getName()))
        elseif choice == "fishstix" then
            targ:setCharVar("[DQ]Fishstix", 0)
            targ:setCharVar("[DQ]Fishstix_Z", 0)
            player:PrintToPlayer(string.format("You have reset %s's Fishstix daily quest.", targ:getName()))
        elseif choice == "murdoc" then
            targ:setCharVar("[DQ]Murdoc", 0)
            targ:setCharVar("[DQ]Murdoc_Z", 0)
            targ:setCharVar("[DQ]Murdoc_MT", 0)
            targ:setCharVar("[DQ]Murdoc_KA", 0)
            player:PrintToPlayer(string.format("You have reset %s's Murdoc daily quest.", targ:getName()))
        elseif choice == "mistrix" then
            targ:setCharVar("[DQ]Mistrix", 0)
            targ:setCharVar("[DQ]Mistrix_I", 0)
            player:PrintToPlayer(string.format("You have reset %s's Mistrix daily quest.", targ:getName()))
        elseif choice == "saltlik" then
            targ:setCharVar("[DQ]Saltlik", 0)
            targ:setCharVar("[DQ]Saltlik_Z", 0)
            targ:setCharVar("[DQ]Saltlik_NM", 0)
            player:PrintToPlayer(string.format("You have reset %s's Saltlik daily quest.", targ:getName()))
        elseif choice == "beetrix" then
            targ:setCharVar("[DQ]Beetrix", 0)
            targ:setCharVar("[DQ]Beetrix_Z", 0)
            targ:setCharVar("[DQ]Beetrix_RE", 0)
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
