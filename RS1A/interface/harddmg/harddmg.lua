require "/scripts/util.lua"

function init()
  player.giveBlueprint("parryshield")
  widget.setProgress("prgSuffer", 0.5)
  widget.blur("background")
end

function update(dt)
  
end

function uninit()

end