require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    animator.playSound("youidiot1") --cruelty squad??????????????????
    script.setUpdateDelta(3)
    self.timer = 5.4
    self.esploded = false
end

function update(dt)
    self.timer = self.timer - dt 
    if (self.timer<0 and esploded == false) then
        animator.stopAllSounds("youidiot1")
        animator.playSound("youidiot2") 
        status.removeEphemeralEffect("youweremistaken")
        esploded = true
    end
end

function uninit()
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
