-----------------------------------
-- Area: West Ronfaure
--  Mob: River Crab
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 2, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
end

return entity
