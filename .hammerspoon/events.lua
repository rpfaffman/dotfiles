local Events = {}

local function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.launched) then
    if (appName == "Spotify") then
      -- Automatically start Spotify in private session
      appObject:selectMenuItem({ "Spotify", "Private Session" })
    end
  end
end

hs.application.watcher.new(applicationWatcher):start()

return Events
