local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey
local apps = require("configuration.apps")

local awesomeKeys = require("configuration.keys.Global.awesomeKeys")
local tagKeys = require("configuration.keys.Global.tagKeys")
local clientKeys = require("configuration.keys.Global.clientKeys")
local layoutKeys = require("configuration.keys.Global.layoutKeys")
local hotKeys = require('configuration.keys.Global.hotKeys')
local launcherKeys = require('configuration.keys.Global.launcherKeys')
local clipboardKeys = require('configuration.keys.Global.clipboardLayout')
local othersKeys = require('configuration.keys.Global.otherKeys')

-- Extension
local traveler = require("libs.traveler")

-- Key bindings
local globalKeys =
  awful.util.table.join(
  --Awesome group
  awesomeKeys,
  tagKeys,
  clientKeys,
  layoutKeys,
  hotKeys,
  launcherKeys,
  clipboardKeys,
  othersKeys
)
return globalKeys
