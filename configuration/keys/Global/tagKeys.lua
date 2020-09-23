-- Extension
local traveler = require('libs.traveler')
local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local awful = require('awful')

local keys = 
awful.util.table.join(
    -- Tag browsing
    awful.key({modkey}, 'w', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
    awful.key({modkey}, 's', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
    awful.key({altkey, 'Control'}, 'Up', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
    awful.key({altkey, 'Control'}, 'Down', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
    awful.key({modkey}, 'Escape', awful.tag.history.restore, {description = 'go back', group = 'tag'}),
    -- Toggle tag on focused client.
    awful.key(
        {modkey,'Shift'},
        'w',
        function ()
        traveler.MoveUp()
        end,
        {description = 'Move windows up', group = 'tag'}
    ),
    awful.key(
        {modkey,'Shift'},
        's',
        function ()
        traveler.MoveDown()
        end,
        {description = 'Move windows down', group = 'tag'}
    ),
    -- Open default program for tag
    awful.key(
        {modkey},
        't',
        function()
            awful.spawn(
                awful.screen.focused().selected_tag.defaultApp,
                {
                    tag = _G.mouse.screen.selected_tag,
                    placement = awful.placement.bottom_right
                }
            )
        end,
        {description = 'open default program for tag/workspace', group = 'tag'}
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'tag'}
    descr_toggle = {description = 'toggle tag #', group = 'tag'}
    descr_move = {description = 'move focused client to tag #', group = 'tag'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
  end
  keys =
    awful.util.table.join(
    keys,
    -- View tag only.
    awful.key(
      {modkey},
      '#' .. i + 9,
      function()
        traveler.ViewTag(i)
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, 'Control'},
      '#' .. i + 9,
      function()
        traveler.ToogleTag(i)
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {modkey, 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, 'Control', 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:toggle_tag(tag)
          end
        end
      end,
      descr_toggle_focus
    )
    
  )
end

return keys