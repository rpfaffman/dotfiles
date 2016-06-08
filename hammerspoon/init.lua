require 'events'

-- Automatically Reload Config
function reloadConfig(files) hs.reload() end
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()

local function bindHotkeys(mod, bindings, fn)
  for hotkey, arg in pairs(bindings) do
    hs.hotkey.bind(mod, hotkey, function() fn(arg) end)
  end
end

-- Bash Commands and Coroutines
do
  -- Example command
  local mod      = { "alt", "ctrl" }
  local bindings = {
    [ "a" ] = "sleep 4; say 'complete'"
  }

  bindHotkeys(mod, bindings, function(cmd)
    local task = coroutine.create(function()
      os.execute(cmd)
    end)
    coroutine.resume(task)
  end)
end

-- Applications
-- To disable the MacOSX's dictionary hotkey (cmd-ctrl-d),
-- make sure to run in terminal:
-- defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
do
  local mod      = { "cmd", "ctrl" }
  local bindings = {
    [ "q" ] = "Mail",
    [ "w" ] = "Calendar",
    [ "e" ] = "Slack",
    [ "a" ] = "iTerm",
    [ "s" ] = "Google Chrome",
    [ "d" ] = "Zeplin",
    [ "x" ] = "Spotify",
    [ "c" ] = "Messages"
  }

  bindHotkeys(mod, bindings, function(app)
    hs.application.launchOrFocus(app)
  end)
end

-- Window Animation Duration
hs.window.animationDuration = 0.075

-- Window Movement and Sizing (Fixed)
do
  local Size     = require 'size'
  local mod      = { "cmd", "ctrl" }
  local bindings = {
    [ "h" ] = "left",
    [ "l" ] = "right",
    [ "j" ] = "bottom",
    [ "k" ] = "top",
    [ "u" ] = "upperLeft",
    [ "i" ] = "upperRight",
    [ "n" ] = "bottomLeft",
    [ "," ] = "bottomRight",
    [ "m" ] = "full"
  }

  bindHotkeys(mod, bindings, function(location)
    Size[location]()
  end)
end

-- Window Movement (Relative)
do
  local Size     = require 'size'
  local mod      = { "cmd", "ctrl", "shift" }
  local bindings = {
    [ "h" ] = "left",
    [ "l" ] = "right",
    [ "j" ] = "down",
    [ "k" ] = "up"
  }

  bindHotkeys(mod, bindings, function(direction)
    Size.moveLocation(direction)
  end)
end

-- Caffine
do
  local Caffeine = require 'caffeine'
  local mod      = { "cmd", "shift" }
  local bindings = { 
    [ "d" ] = "displayStatus",
    [ "c" ] = "toggle",
    [ "v" ] = "sleep"
  }

  bindHotkeys(mod, bindings, function(method)
    Caffeine[method]()
  end)
end

-- Spotify
do
  local Spotify  = require 'spotify'
  local mod      = { "cmd", "shift" }
  local bindings = {
    [ "a" ] = "previous track",
    [ "s" ] = "next track",
    [ "z" ] = "playpause",
    [ "x" ] = "get the player position"
  }

  bindHotkeys(mod, bindings, function(cmd)
    Spotify.command(cmd)
  end)
end
