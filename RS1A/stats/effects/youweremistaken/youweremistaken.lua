require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    animator.playSound("youweremistaken") --cruelty squad??????????????????
end

function uninit()
    for i=1,10 do --10 times baybeeeeeeeeeeeeeeeeeee
        status.applySelfDamageRequest({
            damageType = "IgnoresDef",
            damage = 9999,
            damageSourceKind = "silverweapon", --because fuck you
            sourceEntityId = entity.id()
        })
    end
end
