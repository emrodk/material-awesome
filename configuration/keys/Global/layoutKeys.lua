local awful = require("awful")
local modkey = require("configuration.keys.mod").modKey
local altkey = require("configuration.keys.mod").altKey

local keys =
    awful.util.table.join(
    awful.key(
        {altkey, "Shift"},
        "Right",
        function()
            awful.tag.incmwfact(0.05)
        end,
        {description = "increase master width factor", group = "layout"}
    ),
    awful.key(
        {altkey, "Shift"},
        "Left",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}
    ),
    awful.key(
        {altkey, "Shift"},
        "Down",
        function()
            awful.client.incwfact(0.05)
        end,
        {description = "decrease master height factor", group = "layout"}
    ),
    awful.key(
        {altkey, "Shift"},
        "Up",
        function()
            awful.client.incwfact(-0.05)
        end,
        {description = "increase master height factor", group = "layout"}
    ),
    awful.key(
        {modkey, "Shift"},
        "Left",
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = "increase the number of master clients", group = "layout"}
    ),
    awful.key(
        {modkey, "Shift"},
        "Right",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = "decrease the number of master clients", group = "layout"}
    ),
    awful.key(
        {modkey, "Control"},
        "Left",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = "increase the number of columns", group = "layout"}
    ),
    awful.key(
        {modkey, "Control"},
        "Right",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = "decrease the number of columns", group = "layout"}
    ),
    awful.key(
        {modkey},
        "space",
        function()
            awful.layout.inc(1)
        end,
        {description = "select next", group = "layout"}
    ),
    awful.key(
        {modkey, "Shift"},
        "space",
        function()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}
    )
)

return keys
