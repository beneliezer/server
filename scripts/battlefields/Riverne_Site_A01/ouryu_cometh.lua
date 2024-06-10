-----------------------------------
-- Area: Riverne Site #A01
-- Name: Ouryu Cometh
-- !pos -612.800 1.750 693.190 29
-----------------------------------
local riverneID = zones[xi.zone.RIVERNE_SITE_A01]
-----------------------------------

local content = Battlefield:new({
    zoneId        = xi.zone.RIVERNE_SITE_A01,
    battlefieldId = xi.battlefield.id.OURYU_COMETH,
    maxPlayers    = 18,
    levelCap      = 75,
    timeLimit     = utils.minutes(30),
    index         = 0,
    area          = 1,
    entryNpc      = 'Spatial_Displacement',
    exitNpc       = { '_0u1', '_0u2', '_0u3' },
    requiredItems =
    { 
        xi.item.CLOUD_EVOKER, 
        wearMessage = riverneID.text.TIME_LIMIT_FOR_THIS_BATTLE_IS + 2, 
        wornMessage = riverneID.text.TIME_LIMIT_FOR_THIS_BATTLE_IS + 1,
    },
    grantXP          = 1500,
})

content:addEssentialMobs({ 'Ouryu' })

content.groups =
{
    {
        mobs = { 'Ouryu' },
        superlink = true,
        spawned = true,
        death = utils.bind(content.handleAllMonstersDefeated, content),
    },
    {
        mobs = { 'Ziryu' },
        superlink = true,
        spawned = true,
    },
}

return content:register()
