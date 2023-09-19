require "/scripts/util.lua"
require "/scripts/status.lua"

function init()
    animator.playSound("youidiot1") --cruelty squad??????????????????
    script.setUpdateDelta(3)
    self.timer = 95
    self.esploded = false
    effect.setParentDirectives("fade=FF0000=0.5")
end

function update(dt)
    self.timer = self.timer - 1
    if (self.timer % 10 <= 5) then
        effect.setParentDirectives("fade=FF0000=0.5")
    else 
        effect.setParentDirectives("fade=FFFFFFF=1.0")
    end

    if (self.timer<1 and not esploded) then
        if (self.timer==0) then
            animator.stopAllSounds("youidiot1")
            animator.playSound("youidiot2")
        else 
            esploded = true --to prevent weird shit
            uninit()
        end
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
