-----------------------------------
-- Area: Monarch Linn
-- Name: Bad Seed
-----------------------------------
local content = Battlefield:new({
    zoneId           = xi.zone.MONARCH_LINN,
    battlefieldId    = xi.battlefield.id.BAD_SEED,
    maxPlayers       = 18,
    levelCap         = 40,
    timeLimit        = utils.minutes(30),
    index            = 3,
    entryNpc         = 'SD_Entrance',
    exitNpcs         = { 'SD_BCNM_Exit_1', 'SD_BCNM_Exit_2', 'SD_BCNM_Exit_3' },
    requiredKeyItems = { xi.ki.MONARCH_BEARD },
    grantXP          = 1500,
})

content:addEssentialMobs({ 'Hamadryad' })

content.loot =
{
    {
        { item =    0, weight = 950 }, -- Nothing
        { item = 1842, weight =  50 }, -- Cloud Evoker
    },
    {
        { item =     0, weight = 500 }, -- Nothing
        { item = 15433, weight = 250 }, -- Reverend Sash
        { item = 15434, weight = 250 }, -- Vanguard Belt
    },
    {
        { item =     0, weight = 350 }, -- Nothing
        { item = 13550, weight = 200 }, -- Crossbowman's Ring
        { item = 14675, weight = 150 }, -- Woodsman Ring
        { item = 13549, weight = 300 }, -- Ether Ring
    },
}

return content:register()
