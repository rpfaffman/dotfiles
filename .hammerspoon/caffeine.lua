local Caffeine = {}
local sleepType = "system"

function Caffeine.displayStatus()
  hs.alert.show(hs.caffeinate.get(sleepType))
end

function Caffeine.sleep()
  hs.caffeinate.systemSleep()
end

function Caffeine.toggle()
  local state = hs.caffeinate.get(sleepType)
  hs.caffeinate.toggle(sleepType, not state, true)
  hs.alert.show(not state and "caffeine on" or "caffeine off")
end

return Caffeine
