-----------------------------------
-- Pulling the Strings
-- Mine Shaft #2716 battlefield
-----------------------------------
local ID = zones[xi.zone.MINE_SHAFT_2716]
-----------------------------------

-- Temporary loot table until handleLootRolls can properly pick loot from table using job index.
local lootTable =
{
    -- Pulling the Strings Specific Job Rewards
    [xi.job.WAR] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.JANIZARY_EARRING, droprate = 250 },
        },
    },
    
    [xi.job.MNK] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.COUNTER_EARRING, droprate = 250 },
        },
    },

    [xi.job.WHM] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.HEALING_FEATHER, droprate = 250 },
        },
    },

    [xi.job.BLM] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.SPIRIT_LANTERN, droprate = 250 },
        },
    },

    [xi.job.RDM] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.SANATION_RING, droprate = 250 },
        },
    },

    [xi.job.THF] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.ASSASSINS_RING, droprate = 250 },
        },
    },

    [xi.job.PLD] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.VIAL_OF_REFRESH_MUSK, droprate = 250 },
        },
    },

    [xi.job.DRK] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.TACTICAL_RING, droprate = 250 },
        },
    },

    [xi.job.BST] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.PACIFIST_RING, droprate = 250 },
        },
    },

    [xi.job.BRD] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.GETSUL_RING, droprate = 250 },
        },
    },

    [xi.job.RNG] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.DEADEYE_EARRING, droprate = 250 },
        },
    },

    [xi.job.SAM] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.GAMUSHARA_EARRING, droprate = 250 },
        },
    },

    [xi.job.NIN] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.NARUKO_EARRING, droprate = 250 },
        },
    },

    [xi.job.DRG] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.BAG_OF_WYVERN_FEED, droprate = 250 },
        },
    },

    [xi.job.SMN] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.ASTRAL_POT, droprate = 250 },
        },
    },

    [xi.job.BLU] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.DEATH_CHAKRAM, droprate = 250 },
        },
    },

    [xi.job.COR] =
    {
        {
            { itemid = 0, droprate = 750 },
            { itemid = xi.item.CORSAIR_BULLET_POUCH, droprate = 250 },
        },
    },

    [xi.job.PUP] =
    {
        {
            { itemid = 936, droprate = 1000 },
--             { itemid = xi.item.ATTUNER,            droprate = 100 },
--             { itemid = xi.item.TACTICAL_PROCESSOR, droprate = 100 },
--             { itemid = xi.item.DRUM_MAGAZINE,      droprate = 100 },
--             { itemid = xi.item.EQUALIZER,          droprate = 100 },
--             { itemid = xi.item.TARGET_MAKER,       droprate = 100 },
--             { itemid = xi.item.MANA_CHANNELER,     droprate = 100 },
--             { itemid = xi.item.ERASER,             droprate = 100 },
--             { itemid = xi.item.SMOKER_SCREEN,      droprate = 100 },
        },
    },
}

local content = Battlefield:new({
    zoneId           = xi.zone.MINE_SHAFT_2716,
    battlefieldId    = xi.battlefield.id.PULLING_THE_STRINGS,
    maxPlayers       = 1,
    levelCap         = 60,
    allowSubjob      = false,
    timeLimit        = utils.minutes(15),
    index            = 3,
    grantXP          = 2000,
    entryNpc         = '_0d0',
    exitNpc          = { '_0d1', '_0d2', '_0d3' }, -- copied from existing mine shaft 2716 battlefield
    requiredKeyItems = { xi.ki.SHAFT_GATE_OPERATING_DIAL, message = ID.text.THE_PARTY_WILL_BE_REMOVED + 8 },
    experimental     = false,
})

function content:checkRequirements(player, npc, registrant, trade)
    for i = xi.job.WAR, xi.job.PUP do
        if player:getMainJob() == i then
            return true
        end
    end
end

function content:onBattlefieldInitialise(battlefield)
    Battlefield.onBattlefieldInitialise(self, battlefield)

    local crate = GetEntityByID(ID.mob.FANTOCCINI[battlefield:getArea()] - 1)
    crate:addListener('ON_TRIGGER', 'TRIGGER_CRATE', function(player, npc)
        npcUtil.openCrate(npc, function()
            -- The new handleLootRolls function does not select the correct index, bug?
            -- content:handleLootRolls(battlefield, content.loot[player:getMainJob()], npc)
            xi.battlefield.HandleLootRolls(battlefield, lootTable[player:getMainJob()], nil, npc)
        end)
    end)
end

content:addEssentialMobs({ 'Fantoccini' })

content.groups =
{
    {
        mobs = { 'Moblin_Fantocciniman' },
        stationary = true,
        superlink = true,
    },
    {
        mobs = { 'Fantoccini_Monster' },
        spawned = false,
        superlink = true,
    },
    {
        mobs = { 'Fantoccini_Wyvern' },
        spawned = false,
        superlink = true,
    },
    {
        mobs = { 'Fantoccini_Avatar' },
        spawned = false,
        superlink = true,
    },
    {
        mobs = { 'Fantoccini_Puppet' },
        spawned = false,
        superlink = true,
    },
    {
        mobs = { 'Fantoccini_Automaton' },
        spawned = false,
        superlink = true,
    },
    {
        mobs = { 'Fantoccini' },
        superlink = true,
        death = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

--[[
content.loot =
{
    [xi.job.WAR] =
    {
        { item = xi.item.NONE,             weight = 750 },
        { item = xi.item.JANIZARY_EARRING, weight = 250 },
    },

    [xi.job.MNK] =
    {
        { item = xi.item.NONE,            weight = 750 },
        { item = xi.item.COUNTER_EARRING, weight = 250 },
    },

    [xi.job.WHM] =
    {
        { item = xi.item.NONE,            weight = 750 },
        { item = xi.item.HEALING_FEATHER, weight = 250 },
    },

    [xi.job.BLM] =
    {
        { item = xi.item.NONE,           weight = 750 },
        { item = xi.item.SPIRIT_LANTERN, weight = 250 },
    },

    [xi.job.RDM] =
    {
        { item = xi.item.NONE,          weight = 750 },
        { item = xi.item.SANATION_RING, weight = 250 },
    },

    [xi.job.THF] =
    {
        { item = xi.item.NONE,           weight = 750 },
        { item = xi.item.ASSASSINS_RING, weight = 250 },
    },

    [xi.job.PLD] =
    {
        { item = xi.item.NONE,                 weight = 750 },
        { item = xi.item.VIAL_OF_REFRESH_MUSK, weight = 250 },
    },
    
    [xi.job.DRK] =
    {
        { item = xi.item.NONE,          weight = 750 },
        { item = xi.item.TACTICAL_RING, weight = 250 },
    },

    [xi.job.BST] =
    {
        { item = xi.item.NONE,          weight = 750 },
        { item = xi.item.PACIFIST_RING, weight = 250 },
    },

    [xi.job.BRD] =
    {
        { item = xi.item.NONE,        weight = 750 },
        { item = xi.item.GETSUL_RING, weight = 250 },
    },

    [xi.job.RNG] =
    {
        { item = xi.item.NONE,            weight = 750 },
        { item = xi.item.DEADEYE_EARRING, weight = 250 },
    },
    
    [xi.job.SAM] =
    {
        { item = xi.item.NONE,              weight = 750 },
        { item = xi.item.GAMUSHARA_EARRING, weight = 250 },
    },

    [xi.job.NIN] =
    {
        { item = xi.item.NONE,           weight = 750 },
        { item = xi.item.NARUKO_EARRING, weight = 250 },
    },

    [xi.job.DRG] =
    {
        { item = xi.item.NONE,               weight = 750 },
        { item = xi.item.BAG_OF_WYVERN_FEED, weight = 250 },
    },
    
    [xi.job.SMN] =
    {
        { item = xi.item.NONE,       weight = 750 },
        { item = xi.item.ASTRAL_POT, weight = 250 },
    },

    [xi.job.BLU] =
    {
        { item = xi.item.NONE,          weight = 750 },
        { item = xi.item.DEATH_CHAKRAM, weight = 250 },
    },

    [xi.job.COR] =
    {
        { item = xi.item.NONE,                 weight = 750 },
        { item = xi.item.CORSAIR_BULLET_POUCH, weight = 250 },
    },

    [xi.job.PUP] =
    {
        -- PUP
        { item = xi.item.NONE,               weight = 200 },
        { item = xi.item.ATTUNER,            weight = 100 },
        { item = xi.item.DRUM_MAGAZINE,      weight = 100 },
        { item = xi.item.EQUALIZER,          weight = 100 },
        { item = xi.item.MANA_CHANNELER,     weight = 100 },
        { item = xi.item.SMOKE_SCREEN,       weight = 100 },
        { item = xi.item.TACTICAL_PROCESSOR, weight = 100 },
        { item = xi.item.TARGET_MARKER,      weight = 100 },
    },
}
]]--

return content:register()
