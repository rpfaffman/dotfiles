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

local directions = {
  left  = { x=-0.25, y=0     },
  right = { x=0.25,  y=0     },
  up    = { x=0,     y=-0.25 },
  down  = { x=0,     y=0.25  }
}

local function retrieveState()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local winFrame = win:frame()
  local screen = win:screen()
  local screenFrame = screen:frame()
  return win, winFrame, screenFrame
end

local function setLocation(coords)
  local win, winFrame, screenFrame = retrieveState()
  if not (win and winFrame and screenFrame) then return end

  winFrame.x = (coords.x * screenFrame.w) + screenFrame.x
  winFrame.y = (coords.y * screenFrame.h) + screenFrame.y
  winFrame.w = coords.w * screenFrame.w
  winFrame.h = coords.h * screenFrame.h

  win:setFrame(winFrame)
end

-- Moving Windows to Relative Locations
function Size.moveLocation(direction)
  local win, winFrame, screenFrame = retrieveState()
  if not (win and winFrame and screenFrame) then return end

  winFrame.x = winFrame.x + (screenFrame.w * directions[direction].x)
  winFrame.y = winFrame.y + (screenFrame.h * directions[direction].y)

  win:setFrame(winFrame)
end

-- Moving/Sizing Windows to Fixed Locations
for name, coords in pairs(locations) do
  Size[name] = function()
    setLocation(coords)
  end
end

return Size
