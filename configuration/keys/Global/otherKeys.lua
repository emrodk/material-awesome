local awful = require("awful")
local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

local keys =
    awful.util.table.join(
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
    -- vfio integration
    awful.key(
        {"Control", altkey},
        "space",
        function()
            awful.util.spawn_with_shell("vm-attach attach")
        end
    ),
    -- Lutris hotkey
    awful.key(
        {modkey},
        "g",
        function()
            awful.util.spawn_with_shell("lutris")
        end
    ),
    -- System Monitor hotkey
    awful.key(
        {modkey},
        "m",
        function()
            awful.util.spawn_with_shell("mate-system-monitor")
        end
    ),
    -- Kill VLC
    awful.key(
        {modkey},
        "v",
        function()
            awful.util.spawn_with_shell("killall -9 vlc")
        end
    )
)

return keys
