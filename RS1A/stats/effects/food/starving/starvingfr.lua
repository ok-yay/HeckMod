function init()
  world.sendEntityMessage(entity.id(), "queueRadioMessage", "starving")

  self.soundInterval = config.getParameter("soundInterval")
  self.soundTimer = 0

  self.tickTime = 1.0
  self.tickTimer = self.tickTime
  self.timer = 0
  self.compoundDamage = config.getParameter("starvationCompoundDamage", 1)
  self.movementModifiers = config.getParameter("movementModifiers", {})
end

function update(dt)
  self.soundTimer = math.max(0, self.soundTimer - dt)
  if self.soundTimer == 0 then
    animator.playSound("beep")
    self.soundTimer = self.soundInterval
  end

  self.timer = self.timer + dt
  world.sendEntityMessage(entity.id(), "queueRadioMessage", "exploreclueplanet")

  if status.resource("hellActive") == 1.0 then
    local tickDamage = self.compoundDamage * self.timer * dt * 5
    if (status.resource("health") - tickDamage <= 0) then
      sb.logInfo("!!DEAD!!," + entity.id() + ",STARVING")
    end
    status.modifyResource("health", -tickDamage)
    mcontroller.controlModifiers(self.movementModifiers)
  else
    local tickDamage = self.compoundDamage * self.timer * dt
    status.modifyResource("health", -tickDamage)
    mcontroller.controlModifiers(self.movementModifiers)
  end

end

function uninit()

end
