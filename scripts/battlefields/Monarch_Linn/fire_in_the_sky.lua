-----------------------------------
-- Area: Monarch Linn
-- Name: Fire in the Sky
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
        { item = xi.item.NONE,         weight = 950 }, -- Nothing
        { item = xi.item.CLOUD_EVOKER, weight =  50 }, -- Cloud Evoker
    },
    {
        { item = xi.item.NOTHING,        weight = 500 }, -- Nothing
        { item = xi.item.THUGS_ZAMBURAK, weight = 250 }, -- Thug's Zamburak
        { item = xi.item.HORROR_VOULGE , weight = 250 }, -- Horror Voulge
    },
    {
        { item = xi.item.NONE,              weight = 350 }, -- Nothing
        { item = xi.item.CROSSBOWMANS_RING, weight = 200 }, -- Crossbowman's Ring
        { item = xi.item.WOODSMAN_RING,     weight = 150 }, -- Woodsman Ring
        { item = xi.item.ETHER_RING,        weight = 300 }, -- Ether Ring
    },
}

return content:register()
