require "/scripts/util.lua"
require "/scripts/status.lua"


function init() --hard dmg doesnt go away nearly as easily this time buckaroo!
    -- so APPARENT-FUCKING-LY this function gets called on death or some shit when you die (or join i guess, there may be others but i cant think of any. might test beaming down and seeing what that does)
    self.deathTrack = false
    self.timed = 0
end

function update(dt)
    if (deathTrack == false) then
        deathTrack = true
        stageHandJank()
    end
    
    if (status.resource("hellActive") == 0.0 and status.resource("flourEater") == 0.0) then
        self.timed = self.timed + 1
    end

    if (self.timed>5) then
        status.clearPersistentEffects("deathTracking")
    end

end

function stageHandJank()
    world.sendEntityMessage(entity.id(), "perhapsDied")
end

function uninit()
end
