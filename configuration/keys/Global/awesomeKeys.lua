local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup').widget
local apps = require('configuration.apps')
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local keys =
  awful.util.table.join(
  -- Hotkeys
  awful.key({modkey}, 'F1', hotkeys_popup.show_help, {description = 'show help', group = 'awesome'}),
  awful.key(
    {modkey},
    'r',
    function()
      _G.screen.primary.left_panel:toggle(true)
    end,
    {description = 'show main menu', group = 'awesome'}
  ),
  awful.key(
    {altkey},
    'space',
    function()
      _G.screen.primary.left_panel:toggle(true)
    end,
    {description = 'show main menu', group = 'awesome'}
  ),
  -- Programms
  awful.key(
    {modkey},
    'l',
    function()
      awful.spawn(apps.default.lock)
    end,
    {description = 'Lock the screen', group = 'awesome'}
  ),
  awful.key({modkey, 'Control'}, 'r', _G.awesome.restart, {description = 'reload awesome', group = 'awesome'}),
  awful.key({modkey, 'Control'}, 'q', _G.awesome.quit, {description = 'quit awesome', group = 'awesome'})
  )

return keys