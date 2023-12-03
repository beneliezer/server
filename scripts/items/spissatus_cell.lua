-----------------------------------------
-- Spissatus Cell
-- ID 5384
-- Removes MP Down effect
-----------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return itemUtil.onSalvageItemCheck(target, xi.effect.DEBILITATION, 0x100)
end

itemObject.onItemUse = function(target)
    return itemUtil.onSalvageItemUse(target, xi.effect.DEBILITATION, 0x100, 19)
end

return itemObject
