local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')

local awesomeKeys = require('configuration.keys.Global.awesomeKeys')
local tagKeys = require('configuration.keys.Global.tagKeys')

-- Extension
local traveler = require('libs.traveler')

-- Key bindings
local globalKeys =
  awful.util.table.join(
  --Awesome group
  awesomeKeys,
  tagKeys,
  
  -- Default client focus
  awful.key(
    {modkey},
    'd',
    function()
      awful.client.focus.byidx(1)
    end,
    {description = 'focus next by index', group = 'client'}
  ),
  awful.key(
    {modkey},
    'a',
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = 'focus previous by index', group = 'client'}
  ),
  awful.key({modkey}, 'u', awful.client.urgent.jumpto, {description = 'jump to urgent client', group = 'client'}),
  awful.key(
    {altkey},
    'Tab',
    function()
      --awful.client.focus.history.previous()
      awful.client.focus.byidx(1)
      if _G.client.focus then
        _G.client.focus:raise()
      end
    end,
    {description = 'Switch to next window', group = 'client'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Tab',
    function()
      --awful.client.focus.history.previous()
      awful.client.focus.byidx(-1)
      if _G.client.focus then
        _G.client.focus:raise()
      end
    end,
    {description = 'Switch to previous window', group = 'client'}
  ),
  awful.key(
    {modkey},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.delayed_screenshot)
    end,
    {description = 'Mark an area and screenshot it 10 seconds later (clipboard)', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {modkey},
    'p',
    function()
      awful.util.spawn_with_shell(apps.default.screenshot)
    end,
    {description = 'Take a screenshot of your active monitor and copy it to clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'p',
    function()
      awful.util.spawn_with_shell(apps.default.region_screenshot)
    end,
    {description = 'Mark an area and screenshot it to your clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {modkey},
    'c',
    function()
      awful.util.spawn(apps.default.editor)
    end,
    {description = 'open a text/code editor', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'b',
    function()
      awful.util.spawn(apps.default.browser)
    end,
    {description = 'open a browser', group = 'launcher'}
  ),
  -- Standard program
  awful.key(
    {modkey},
    'x',
    function()
      awful.spawn(apps.default.terminal)
    end,
    {description = 'open a terminal', group = 'launcher'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Right',
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = 'increase master width factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Left',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = 'decrease master width factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Down',
    function()
      awful.client.incwfact(0.05)
    end,
    {description = 'decrease master height factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Up',
    function()
      awful.client.incwfact(-0.05)
    end,
    {description = 'increase master height factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Left',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = 'increase the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Right',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = 'decrease the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Left',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = 'increase the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Right',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = 'decrease the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey},
    'space',
    function()
      awful.layout.inc(1)
    end,
    {description = 'select next', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'space',
    function()
      awful.layout.inc(-1)
    end,
    {description = 'select previous', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'n',
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        _G.client.focus = c
        c:raise()
      end
    end,
    {description = 'restore minimized', group = 'client'}
  ),
  -- Dropdown application
  awful.key(
    {modkey},
    'z',
    function()
      _G.toggle_quake()
    end,
    {description = 'dropdown application', group = 'launcher'}
  ),
  -- Widgets popups
  --[[awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'show weather', group = 'widgets'}
  ),--]]
  -- Brightness
  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('xbacklight -inc 10')
    end,
    {description = '+10%', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('xbacklight -dec 10')
    end,
    {description = '-10%', group = 'hotkeys'}
  ),
  -- ALSA volume control
  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%+')
    end,
    {description = 'volume up', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%-')
    end,
    {description = 'volume down', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      --
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerOff',
    function()
      _G.exit_screen_show()
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  -- Screen management
  awful.key(
    {modkey},
    'o',
    awful.client.movetoscreen,
    {description = 'move window to next screen', group = 'client'}
  ),
  -- vfio integration
  awful.key(
    {'Control',altkey},
    'space',
    function()
      awful.util.spawn_with_shell('vm-attach attach')
    end
  ),
  -- Lutris hotkey
  awful.key(
    {modkey},
    'g',
    function()
      awful.util.spawn_with_shell('lutris')
    end
  ),
  -- System Monitor hotkey
  awful.key(
    {modkey},
    'm',
    function()
      awful.util.spawn_with_shell('mate-system-monitor')
    end
  ),
  -- Kill VLC
  awful.key(
    {modkey},
    'v',
    function()
      awful.util.spawn_with_shell('killall -9 vlc')
    end
  ),
  -- File Manager
  awful.key(
    {modkey},
    'e',
    function()
      awful.util.spawn(apps.default.files)
    end,
    {description = 'filebrowser', group = 'hotkeys'}
  ),
  -- Emoji Picker
  awful.key(
    {modkey},
    'a',
    function()
      awful.util.spawn_with_shell('ibus emoji')
    end,
    {description = 'Open the ibus emoji picker to copy an emoji to your clipboard', group = 'hotkeys'}
  )
)

return globalKeys
