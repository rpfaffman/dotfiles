local Spotify = {}

function Spotify.command(cmd)
  _, result = hs.applescript.applescript(string.gsub([[
    tell application "Spotify"
      COMMAND
      get the name of the current track
    end tell
  ]], "COMMAND", cmd))
  hs.alert.show(result)
end

return Spotify
