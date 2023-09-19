require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    animator.playSound("youidiot1") --cruelty squad??????????????????
end

function uninit()
    animator.playSound("youidiot2")
    for i=1,10 do --just to ensure
        status.applySelfDamageRequest({
            damageType = "IgnoresDef",
            damage = 9999,
            damageSourceKind = "silverweapon", --because fuck you
            sourceEntityId = entity.id()
        })
    end
    world.damageTileArea(entity.position(),10,"foreground",entity.position(),"explosive",9999,50)
end
