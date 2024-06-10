-----------------------------------
-- Area: Monarch Linn
-- Name: Fire in the Sky
-----------------------------------
local monarchLinnID = zones[xi.zone.MONARCH_LINN]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.MONARCH_LINN,
    battlefieldId    = xi.battlefield.id.FIRE_IN_THE_SKY,
    maxPlayers       = 3,
    levelCap         = 40,
    timeLimit        = utils.minutes(15),
    index            = 2,
    entryNpc         = 'SD_Entrance',
    exitNpcs         = { 'SD_BCNM_Exit_1', 'SD_BCNM_Exit_2', 'SD_BCNM_Exit_3' },
    requiredKeyItems = { xi.ki.MONARCH_BEARD },
    grantXP          = 1500,
})

content:addEssentialMobs({ 'Razon' })

content.loot =
{
    {
        { item = xi.item.STONE_SPLITTER,           weight = 250 }, -- Stone-splitter
        { item = xi.item.FRENZY_FIFE,              weight = 250 }, -- Frenzy Fife
        { item = xi.item.BLAU_DOLCH,               weight = 250 }, -- Blau Dolch
        { item = xi.item.RAISE_II_ROD,             weight = 250 }, -- Raise II Rod
    },
    {
        { item = xi.item.NONE,                     weight = 250 }, -- nothing
        { item = xi.item.ONIMARU,                  weight = 250 }, -- Onimaru
        { item = xi.item.MANEATER,                 weight = 250 }, -- Maneater
        { item = xi.item.WAGH_BAGHNAKHS,           weight = 250 }, -- Wagh Baghnakhs
    },
    {
        { item = xi.item.NONE,         weight = 812 }, -- nothing
        { item = xi.item.CLOUD_EVOKER, weight = 188 }, -- Cloud Evoker
    },
    {
        { item = xi.item.POT_OF_VIRIDIAN_URUSHI,   weight = 333 }, -- Viridian Urushi
        { item = xi.item.UNICORN_HORN,             weight = 333 }, -- Unicorn Horn
        { item = xi.item.CORSE_CAPE,               weight = 334 }, -- Corse Cape
    },
    {
        { item = xi.item.SQUARE_OF_ELTORO_LEATHER, weight = 333 }, -- Eltoro Leather
        { item = xi.item.PIECE_OF_CASSIA_LUMBER,   weight = 333 }, -- Cassia Lumber
        { item = xi.item.DRAGON_BONE,              weight = 334 }, -- Dragon Bone
    },
}

return content:register()
