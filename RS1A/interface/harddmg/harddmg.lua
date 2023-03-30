require "/scripts/util.lua"

function init()
  player.giveBlueprint("parryshield")
  widget.setProgress("prgCurrentProgress", 0.5)
  widget.blur("background")
end

function update(dt)
  
end

function uninit()

end