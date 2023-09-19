local oldInitStatApplier = init -- this is just fu stat applier but again. could've made a thing that is specifically talored around doing the healthbonus down but idgaf
local oldUninitStatApplier = uninit

function init()
    if not genericStatHandler then
        genericStatHandler = effect.addStatModifierGroup(config.getParameter("stats", {}))
    else
        effect.setStatModifierGroup(genericStatHandler, config.getParameter("stats", {}))
    end
    if oldInitStatApplier then
        oldInitStatApplier()
    end
end

function uninit()
    if genericStatHandler then
        effect.removeStatModifierGroup(genericStatHandler)
    else
        sb.logInfo("lazyness.lua:uninit()::%s::%s", entity.entityType(), status.activeUniqueStatusEffectSummary())
    end
    genericStatHandler = nil
    if oldUninitStatApplier then
        oldUninitStatApplier()
    end
end
