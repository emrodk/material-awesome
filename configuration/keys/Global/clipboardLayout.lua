local awful = require('awful')
local modkey = require("configuration.keys.mod").modKey
local apps = require("configuration.apps")

local keys = 
awful.util.table.join (

awful.key(
    {modkey},
    "Print",
    function()
      awful.util.spawn_with_shell(apps.default.delayed_screenshot)
    end,
    {description = "Mark an area and screenshot it 10 seconds later (clipboard)", group = "screenshots (clipboard)"}
  ),
  awful.key(
    {modkey},
    "p",
    function()
      awful.util.spawn_with_shell(apps.default.screenshot)
    end,
    {
      description = "Take a screenshot of your active monitor and copy it to clipboard",
      group = "screenshots (clipboard)"
    }
  ),
  awful.key(
    {altkey, "Shift"},
    "p",
    function()
      awful.util.spawn_with_shell(apps.default.region_screenshot)
    end,
    {description = "Mark an area and screenshot it to your clipboard", group = "screenshots (clipboard)"}
  )
)

return keys