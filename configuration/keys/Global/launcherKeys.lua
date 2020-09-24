local awful = require("awful")
local modkey = require("configuration.keys.mod").modKey
local apps = require("configuration.apps")

local keys =
    awful.util.table.join(
    awful.key(
        {modkey},
        "b",
        function()
            awful.util.spawn(apps.default.browser)
        end,
        {description = "open a browser", group = "launcher"}
    ),
    -- Standard program
    awful.key(
        {modkey},
        "x",
        function()
            awful.spawn(apps.default.terminal)
        end,
        {description = "open a terminal", group = "launcher"}
    ),
    -- Dropdown application
    awful.key(
        {modkey},
        "z",
        function()
            _G.toggle_quake()
        end,
        {description = "dropdown application", group = "launcher"}
    ),
    awful.key(
        {modkey},
        "c",
        function()
            awful.util.spawn(apps.default.editor)
        end,
        {description = "open a text/code editor", group = "launcher"}
    )
)

return keys
