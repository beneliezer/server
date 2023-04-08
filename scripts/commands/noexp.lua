---------------------------------------------------------------------------------------------------
-- func: noexp
-- desc: Cancels dedication.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player)

    if player:hasStatusEffect(xi.effect.DEDICATION) == true then
        player:delStatusEffect(xi.effect.DEDICATION);
        player:PrintToPlayer("Dedication effect removed!");
    end

end
