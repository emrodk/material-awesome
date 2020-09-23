local awful = require('awful')

local traveler =  {}

function traveler.MoveUp()
    -- get current tag
    local t = client.focus and client.focus.first_tag or nil
    if t == nil then
        return
    end
    -- get previous tag (modulo 7 excluding 0 to wrap from 1 to 9)
    local tag = client.focus.screen.tags[(t.name - 2) % 7 + 1]
    _G.client.focus:move_to_tag(tag)
end

function traveler.MoveDown()
    -- get current tag
    local t = client.focus and client.focus.first_tag or nil
    if t == nil then
        return
    end
    -- get next tag (modulo 7 excluding 0 to wrap from 9 to 1)
    local tag = client.focus.screen.tags[(t.name % 7) + 1]
    _G.client.focus:move_to_tag(tag)
end

function traveler.ViewTag(i)
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
        tag:view_only()
    end
end

function traveler.ToogleTag(i)
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
        awful.tag.viewtoggle(tag)
    end
end

return traveler

