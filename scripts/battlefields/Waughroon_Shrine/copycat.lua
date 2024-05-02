-----------------------------------
-- Copycat
-- Waughroon Shrine KSNM30, Clotho Orb
-- !additem 1180
-----------------------------------
local waughroonID = zones[xi.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.WAUGHROON_SHRINE,
    battlefieldId    = xi.battlefield.id.COPYCAT,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 16,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { xi.item.CLOTHO_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

    experimental = true,
})

-- TODO get the rest of the pets to work

content.groups =
{
    {
        mobIds =
        {
            {
                17367248,
            },

            {
                17367254,
            },

            {
                17367260,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.armouryCrates =
{
    17367249,
    17367255,
    17367261,
}

content.loot =
{
    {
        { item =   655, weight = 1000 }, -- Adaman Ingot
    },
    {
        { item =  1474, weight = 1000 }, -- Infinity Core (custom drop)
    },
    {
        { item =   557, weight =  250 }, -- Ahriman Lens
        { item =   935, weight =  250 }, -- Ahriman Wing
        { item = 19025, weight =   50 }, -- Pole Grip
        { item = 19024, weight =   15 }, -- Sword Strap
        { item = 19026, weight =  250 }, -- Spear Strap
    },
    {
        { item = 17275, weight =  250 }, -- Coffinmaker
        { item = 17509, weight =  250 }, -- Destroyers
        { item = 17207, weight =  250 }, -- Expunger
        { item = 17944, weight =  250 }, -- Retributor
    },
    {
        { item = 14762, weight =  250 }, -- Atillas Earring
        { item = 17700, weight =  250 }, -- Durandal
        { item = 18006, weight =  250 }, -- Hoplites Harpe
        { item = 17842, weight =  250 }, -- Sorrowful Harpe
    },
    {
        { item = 15327, weight =  550 }, -- Fuma Sune-ate
        { item =   646, weight =  200 }, -- Chunk of Adaman Ore
        { item =   747, weight =  250 }, -- Orichalcum Ingot
    },
    {
        { item =   887, weight =   50 }, -- Coral Fragment
        { item =   645, weight =   50 }, -- Chunk of Darksteel Ore
        { item =   902, weight =   50 }, -- Demon Horn
        { item =   702, weight =   50 }, -- Ebony Log
        { item =   737, weight =   50 }, -- Chunk of Gold Ore
        { item =   823, weight =   50 }, -- Spool of Gold Thread
        { item =  4173, weight =   50 }, -- Hi-Reraiser
        { item =   738, weight =   50 }, -- Chunk of Platinum Ore
        { item =   700, weight =   50 }, -- Mahogany Log
        { item =   837, weight =   50 }, -- Spool of Malboro Fiber
        { item =   644, weight =   50 }, -- Chunk of Mythril Ore
        { item =   703, weight =   50 }, -- Petrified Log
        { item =   830, weight =   50 }, -- Square of Rainbow Cloth
        { item =   895, weight =   50 }, -- Ram Horn
        { item =  1132, weight =   50 }, -- Square of Raxa
        { item =  4172, weight =   50 }, -- Reraiser
        { item =  4174, weight =   50 }, -- Vile Elixier
        { item =  4175, weight =   50 }, -- Vile Elixir +1
        { item =  2142, weight =   50 }, -- Wailing Ram Horn
        { item =  866,  weight =   50 }, -- Handful of Wyvern Scales
        { item =  942,  weight =   50 }, -- Philosophers Stone
    },
    {
        { item = 1110,  weight =   50 }, -- Vial of Black Beetle Blood
        { item =  836,  weight =   50 }, -- Square of Damascene Cloth
        { item =  658,  weight =   50 }, -- Damascus Ingot
        { item =  837,  weight =   50 }, -- Spool of Malboro Fiber
        { item =  942,  weight =  300 }, -- Philosophers Stone
        { item =  844,  weight =  300 }, -- Phoenix Feather
        { item =  1132, weight =  200 }, -- Square of Raxa
    },
}

return content:register()
