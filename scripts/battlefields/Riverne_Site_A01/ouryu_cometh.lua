-----------------------------------
-- Area: Riverne Site #A01
-- Name: Ouryu Cometh
-- !pos 187.112 -0.5 346.341 30
-----------------------------------
local ID = zones[xi.zone.RIVERNE_SITE_A01]
-----------------------------------
ID.text.MEMBERS_OF_YOUR_PARTY         = 7535
ID.text.TIME_LIMIT_FOR_THIS_BATTLE_IS = 7537
ID.text.ENTERING_THE_BATTLEFIELD_FOR  = 7600

local content = Battlefield:new({
    zoneId        = xi.zone.RIVERNE_SITE_A01,
    battlefieldId = xi.battlefield.id.OURYU_COMETH,
    maxPlayers    = 18,
    levelCap      = 75,
    timeLimit     = utils.minutes(30),
    index         = 0,
    area          = 1,
    entryNpc      = 'Unstable_Displacement',
    exitNpc       = 'Spatial_Displacement',
    requiredItems =
    {
        xi.item.CLOUD_EVOKER,
        wearMessage = ID.text.A_GLOWING_MIST + 280,
        wornMessage = ID.text.A_GLOWING_MIST + 279,
    },
    grantXP          = 1500,
})

content.groups =
{
    {
        mobs           = { 'Ouryu' },
        superlinkGroup = 1,

        -- This death handler needs to be defined locally since there is no armoury crate.
        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },

    {
        mobs           = { 'Ziryu' },
        superlinkGroup = 1,
    },

    {
        mobs = { 'Water_Elemental', 'Earth_Elemental' }
    },
}

return content:register()
