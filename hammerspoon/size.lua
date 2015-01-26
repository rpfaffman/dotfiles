local Size = {}

local locations = {
  left        = { x=0,   y=0,   w=0.5, h=1   },
  right       = { x=0.5, y=0,   w=0.5, h=1   },
  bottom      = { x=0,   y=0.5, w=1,   h=0.5 },
  top         = { x=0,   y=0,   w=1,   h=0.5 },
  upperLeft   = { x=0,   y=0,   w=0.5, h=0.5 },
  upperRight  = { x=0.5, y=0,   w=0.5, h=0.5 },
  bottomLeft  = { x=0,   y=0.5, w=0.5, h=0.5 },
  bottomRight = { x=0.5, y=0.5, w=0.5, h=0.5 },
  full        = { x=0,   y=0,   w=1,   h=1   }
}

local function setLocation(coords)
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local winFrame = win:frame()
  local screen = win:screen()
  local screenFrame = screen:frame()

  winFrame.x = coords.x * screenFrame.w
  winFrame.y = coords.y * screenFrame.h
  winFrame.w = coords.w * screenFrame.w
  winFrame.h = coords.h * screenFrame.h

  win:setFrame(winFrame)
end

for name, coords in pairs(locations) do
  Size[name] = function()
    setLocation(coords)
  end
end

return Size
