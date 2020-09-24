local awful = require("awful")
local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

local keys =
    awful.util.table.join(
    -- Brightness
  awful.key(
    {},
    "XF86MonBrightnessUp",
    function()
      awful.spawn("xbacklight -inc 10")
    end,
    {description = "+10%", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86MonBrightnessDown",
    function()
      awful.spawn("xbacklight -dec 10")
    end,
    {description = "-10%", group = "hotkeys"}
  ),
  -- ALSA volume control
  awful.key(
    {},
    "XF86AudioRaiseVolume",
    function()
      awful.spawn("amixer -D pulse sset Master 5%+")
    end,
    {description = "volume up", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86AudioLowerVolume",
    function()
      awful.spawn("amixer -D pulse sset Master 5%-")
    end,
    {description = "volume down", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86AudioMute",
    function()
      awful.spawn("amixer -D pulse set Master 1+ toggle")
    end,
    {description = "toggle mute", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86AudioNext",
    function()
      --
    end,
    {description = "toggle mute", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86PowerDown",
    function()
      --
    end,
    {description = "toggle mute", group = "hotkeys"}
  ),
  awful.key(
    {},
    "XF86PowerOff",
    function()
      _G.exit_screen_show()
    end,
    {description = "toggle mute", group = "hotkeys"}
  ),
  -- File Manager
  awful.key(
    {modkey},
    "e",
    function()
      awful.util.spawn(apps.default.files)
    end,
    {description = "filebrowser", group = "hotkeys"}
  ),
  -- Emoji Picker
  awful.key(
    {modkey},
    "a",
    function()
      awful.util.spawn_with_shell("ibus emoji")
    end,
    {description = "Open the ibus emoji picker to copy an emoji to your clipboard", group = "hotkeys"}
  )
)

return keys