-----------------------------------
-- Operation Desert Storm
-- Waughroon Shrine KSNM30, Lachesis Orb
-- !additem 1178
-----------------------------------
local waughroonID = zones[xi.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.WAUGHROON_SHRINE,
    battlefieldId    = xi.battlefield.id.OPERATION_DESERT_SWARM,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 17,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { xi.item.LACHESIS_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Platoon_Scorpion' })

content.loot =
{
    {
        { item =  1474, weight = 1000 }, -- Infinity Core (custom drop)
    },

    {
        { item =  1473, weight =  813 }, -- High-quality Scorpion Shell
        { item = 13552, weight =   55 }, -- Serket Ring
        { item =   901, weight =  123 }, -- Venomous Claw
    },

    {
        { item = 17207, weight = 216 }, -- Expunger
        { item = 18005, weight = 295 }, -- Heart Snatcher
        { item = 18217, weight = 239 }, -- Rampager
        { item = 17793, weight = 231 }, -- Senjuinrikio
    },

    {
        { item = xi.item.ANUBISS_KNIFE,    weight = 504 }, -- Anubiss Knife
        { item = xi.item.ADAMAN_INGOT,     weight =   4 }, -- Adaman Ingot
        { item = xi.item.CLAYMORE_GRIP,    weight =  86 }, -- Claymore Grip
        { item = xi.item.ORICHALCUM_INGOT, weight =  22 }, -- Orichalcum Ingot
        { item = xi.item.POLE_GRIP,        weight = 146 }, -- Pole Grip
        { item = xi.item.SWORD_STRAP,      weight =  22 }, -- Sword Strap
    },

    {
        { item = 11287, weight =  50 }, -- Antares Harness (custom drop)
        { item = 15295, weight = 287 }, -- Hierarch Belt
        { item = 12407, weight = 216 }, -- Palmerins Shield
        { item = 14871, weight = 198 }, -- Trainers Gloves
        { item = 15294, weight = 287 }, -- Warwolf Belt
    },

    {
        { item = xi.item.CORAL_FRAGMENT,           weight =  52 }, -- Coral Fragment
        { item = xi.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  56 }, -- Chunk Of Darksteel Ore
        { item = xi.item.DEMON_HORN,               weight =  41 }, -- Demon Horn
        { item = xi.item.EBONY_LOG,                weight =  63 }, -- Ebony Log
        { item = xi.item.CHUNK_OF_GOLD_ORE,        weight =  52 }, -- Chunk Of Gold Ore
        { item = xi.item.SPOOL_OF_GOLD_THREAD,     weight =  26 }, -- Spool Of Gold Thread
        { item = xi.item.SLAB_OF_GRANITE,          weight =  11 }, -- Slab Of Granite
        { item = xi.item.HI_RERAISER,              weight =  37 }, -- Hi-reraiser
        { item = xi.item.MAHOGANY_LOG,             weight = 101 }, -- Mahogany Log
        { item = xi.item.MYTHRIL_INGOT,            weight =   0 }, -- Mythril Ingot
        { item = xi.item.CHUNK_OF_MYTHRIL_ORE,     weight =  52 }, -- Chunk Of Mythril Ore
        { item = xi.item.PETRIFIED_LOG,            weight = 116 }, -- Petrified Log
        { item = xi.item.PHOENIX_FEATHER,          weight =  15 }, -- Phoenix Feather
        { item = xi.item.PHILOSOPHERS_STONE,       weight =  56 }, -- Philosophers Stone
        { item = xi.item.CHUNK_OF_PLATINUM_ORE,    weight =  45 }, -- Chunk Of Platinum Ore
        { item = xi.item.SQUARE_OF_RAINBOW_CLOTH,  weight =  22 }, -- Square Of Rainbow Cloth
        { item = xi.item.RAM_HORN,                 weight =  67 }, -- Ram Horn
        { item = xi.item.SQUARE_OF_RAXA,           weight = 119 }, -- Square Of Raxa
        { item = xi.item.RERAISER,                 weight =  45 }, -- Reraiser
        { item = xi.item.VILE_ELIXIR,              weight =  19 }, -- Vile Elixir
        { item = xi.item.VILE_ELIXIR_P1,           weight =  41 }, -- Vile Elixir +1
        { item = xi.item.HANDFUL_OF_WYVERN_SCALES, weight =  34 }, -- Handful Of Wyvern Scales
    },

    {
        { item = xi.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight =  78 }, -- Vial Of Black Beetle Blood
        { item = xi.item.SQUARE_OF_DAMASCENE_CLOTH,  weight =  56 }, -- Square Of Damascene Cloth
        { item = xi.item.DAMASCUS_INGOT,             weight =  93 }, -- Damascus Ingot
        { item = xi.item.SPOOL_OF_MALBORO_FIBER,     weight =  56 }, -- Spool Of Malboro Fiber
        { item = xi.item.PHILOSOPHERS_STONE,         weight = 157 }, -- Philosophers Stone
        { item = xi.item.PHOENIX_FEATHER,            weight = 276 }, -- Phoenix Feather
        { item = xi.item.SQUARE_OF_RAXA,             weight = 209 }, -- Square Of Raxa
    },
}

return content:register()
