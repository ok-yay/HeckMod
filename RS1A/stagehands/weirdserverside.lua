-- my fucking reaction when, in order to do serversided shit, you need to make a fucking object >:(

require "/scripts/stagehandutil.lua"

function init()
    sb.logInfo("!!DEATH!! " .. config.getParameter("playerThatDied") .. " !!AMOUNT DIED!! " .. config.getParameter("amountTheyHaveDied"))
    stagehand.die()
end
