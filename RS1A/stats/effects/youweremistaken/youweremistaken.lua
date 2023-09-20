require "/scripts/util.lua"
require "/scripts/status.lua"
require "/scripts/vec2.lua"

function init()
    animator.playSound("youidiot1") --cruelty squad??????????????????
    script.setUpdateDelta(3)
    self.timer = 95
    self.esploded = false
    effect.setParentDirectives("fade=FF0000=0.5")
end

function update(dt)
    self.timer = self.timer - 1
    if (self.timer % 6 <= 3) then
        effect.setParentDirectives("fade=FF0000=0.5")
    else 
        effect.setParentDirectives("fade=000000=0.0")
    end

    if (self.timer<1 and not esploded) then
        if (self.timer==0) then
            animator.stopAllSounds("youidiot1")
            animator.playSound("youidiot2")
            animator.setSoundVolume("youidiot2",1.0,0)
        else 
            esploded = true --to prevent weird shit
            uninit()
        end
    end
end

function uninit()
    world.damageTileArea(entity.position(),10,"foreground",entity.position(),"explosive",9999,50)
    world.spawnProjectile(
        "molotovexplosion",
        mcontroller.position(),
        entity.id(),
        vec2.rotate({1, 0},i),
        true,
        {}
    )
    for i=0,360,18 do
        world.spawnProjectile(
            "molotovflame",
            mcontroller.position(),
            entity.id(),
            vec2.rotate({1, 0},i),
            true,
            {}
        )
    end
    for i=1,10 do --just to ensure
        status.applySelfDamageRequest({
            damageType = "IgnoresDef",
            damage = 9999,
            damageSourceKind = "silverweapon", --because fuck you
            sourceEntityId = entity.id()
        })
    end
end
