-----------------------------------
-- Today's Horoscope
-- Horlais Peak KS30, Lachesis Orb
-- !additem 1178
-----------------------------------
local horlaisID = zones[xi.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.HORLAIS_PEAK,
    battlefieldId    = xi.battlefield.id.TODAYS_HOROSCOPE,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 16,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { xi.item.LACHESIS_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Aries' })

content.loot =
{
    {
        { item = 65535, weight = 1000, amount = 24000 }, -- Gil
    },
    {
        { item =  1474, weight = 1000 }, -- Infinity Core (custom drop)
    },
    {
        { item = 18053, weight =  222 }, -- Gravedigger
        { item = 18097, weight =  302 }, -- Gondo-Shizunori
        { item = 18217, weight =  245 }, -- Rampager
        { item = 17944, weight =  231 }, -- Retributor
    },
    {
        { item = 15295, weight = 250 }, -- Hierarch Belt
        { item = 15294, weight = 338 }, -- Warwolf Belt
        { item = 12407, weight = 206 }, -- Palmerin's Shield
        { item = 14871, weight = 206 }, -- Trainer's Gloves
    },
    {
        { item =     0, weight = 342 },   -- Nothing
        { item = 13693, weight = 250 },   -- Aries Mantle
        { item =   655, weight = 230 },   -- Adaman Ingot
        { item =   747, weight = 178 },   -- Orichalcum Ingot
    },
    {
        { item =   911, weight = 292 },   -- Rampaging Horn
        { item =   910, weight = 265 },   -- Lumbering Horn
        { item = 19024, weight = 354 }, -- Sword Strap
        { item = 19027, weight =  89 },  -- Claymore Grip
    },
    {
        { item =  737, weight = 109 },   -- Chunk Of Gold Ore
        { item = 4172, weight =  34 },   -- Reraiser
        { item =  644, weight =  41 },    -- Chunk Of Mythril Ore
        { item =  902, weight =  61 },    -- Demon Horn
        { item =  702, weight = 121 },   -- Ebony Log
        { item =  866, weight =  44 },    -- Handful Of Wyvern Scales
        { item = 4175, weight =  27 },   -- Vile Elixir +1
        { item =  700, weight =  41 },    -- Mahogany Log
        { item =  887, weight =  80 },    -- Coral Fragment
        { item =  703, weight =  72 },    -- Petrified Log
        { item =  844, weight = 111 },   -- Phoenix Feather
        { item =  738, weight =  44 },    -- Chunk Of Platinum Ore
        { item =  895, weight =  14 },    -- Ram Horn
        { item =  830, weight =  14 },    -- Square Of Rainbow Cloth
        { item =  645, weight =  68 },    -- Chunk Of Darksteel Ore
        { item = 4173, weight =  14 },   -- Hi-reraiser
        { item = 1132, weight = 105 },  -- Square Of Raxa
    },
    {
        { item =   0, weight =  150 },     -- Nothing
        { item =  836, weight =  90 },    -- Square Of Damascene Cloth
        { item =  658, weight =  29 },    -- Damascus Ingot
        { item =  942, weight = 148 },   -- Philosophers Stone
        { item =  844, weight = 234 },   -- Phoenix Feather
        { item =  837, weight =  76 },    -- Spool Of Malboro Fiber
        { item = 1132, weight = 232 },  -- Square Of Raxa
        { item = 1110, weight =  41 },   -- Vial Of Black Beetle Blood
    },
}

return content:register()
