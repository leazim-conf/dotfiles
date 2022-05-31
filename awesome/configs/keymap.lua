local gears = require("gears")
local awful = require("awful")
local gmath = require("gears.math")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
local hotkeys_popup = require("awful.hotkeys_popup")
local gfs = require("gears.filesystem")
local naughty = require("naughty")
local apps = require("configs.apps")

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-- Default modkey.
modkey = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"

globalkeys= gears.table.join(
	
-- Launcher
  -- Terminal
  awful.key({ modkey }, "Return", function()
		awful.spawn(apps.default.terminal)
	end, { description = "open terminal", group = "launcher" }),
	
  -- Ranger
  awful.key({ modkey, shift }, "f", function()
		awful.spawn(apps.default.file_manager)
	end, { description = "open file manager", group = "launcher" }),
	
  -- Dmenu
  awful.key({ modkey }, "p", function()
		awful.spawn.with_shell(apps.default.app_launcher)
	end, { description = "open app launcher", group = "launcher" }),



  -- WM
  -- Client and Tabs Bindings
	-- Kill window
  awful.key({ modkey }, "q", function() 
    local cli = client.focus
    cli:kill() 
  end, {description = "close", group = "client"}),
  
  -- Maximize window
  awful.key({ modkey }, "m", function()
    local cli = client.focus
    cli.maximized =  not cli.maximized
    cli:raise()
  end, {description = "(um)maximize window", group = "client"}),

  -- Float window
  awful.key({ modkey }, "n", awful.client.floating.toggle, {description = "(um)float window", group = "client"}),
  
  -- Show/Hide panel
  awful.key({ modkey }, "o", function()
    for scr in screen do 
      scr.mywibox.visible = not scr.mywibox.visible
      if scr.mybottomwibox then
        scr.mybottomwibox.visible = not scr.mybottomwibox.visible
      end
    end
  end, {description = "Show/Hide panel", group = "awesome"}),

  -- Tags
  awful.key({ modkey, ctrl }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey, ctrl }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
  
  -- Next/Prev workspace
  awful.key({ modkey }, "Right", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "Left", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	
  -- Move tabs
  awful.key({ modkey, shift }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, shift }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

  -- Move tab to Prev workspace
  awful.key({ modkey, shift }, "Left", function()
    local cli = client.focus
    if not cli then 
      return end
    local tags = cli.screen.tags
    local s_tag = cli.screen.selected_tag
    local index = s_tag.index
    local newtag = tags[gmath.cycle(#tags, index - 1)]
    cli:move_to_tag(newtag)
  end, {description = "mvoe focused cliento to prev workspace", group = "client" }),
  
  -- Move tab to Next workspace
  awful.key({ modkey, shift }, "Right", function()
    local cli = client.focus
    if not cli then 
      return end
    local tags = cli.screen.tags
    local s_tag = cli.screen.selected_tag
    local index = s_tag.index
    local newtag = tags[gmath.cycle(#tags, index + 1)]
    cli:move_to_tag(newtag)
  end, {description = "mvoe focused cliento to prev workspace", group = "client" }),
  
  -- Move to urgent workspace
  awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	
  -- Resize window
  -- Resize Verticaly Down
  awful.key({ modkey, alt }, "Down", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0, 0, -10)
    else
      awful.client.incwfact(0.025)
    end
  end, {description = "Floating Resize Vertical -", group = "client"}),
  
  -- With J
  awful.key({ modkey, alt }, "j", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0, 0, -10)
    else
      awful.client.incwfact(0.025)
    end
  end, {description = "Floating Resize Vertical -", group = "client"}),
  

  -- Resize Verticaly Up
  awful.key({ modkey, alt }, "Up", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0, 0,  10)
    else
      awful.client.incwfact(-0.025)
    end
  end, {description = "Floating Resize Vertical +", group = "client"}),
 
  -- With k
  awful.key({ modkey, alt }, "k", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0, 0,  10)
    else
      awful.client.incwfact(-0.025)
    end
  end, {description = "Floating Resize Vertical +", group = "client"}),
  

  -- Resize Horizontaly Left
  awful.key({ modkey, alt }, "Left", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0, -10, 0)
    else
      awful.tag.incmwfact(-0.025)
    end
  end, {description = "Floating Resize Horizontal -", group = "client"}),
  
  -- With h
  awful.key({ modkey, alt }, "h", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0, -10, 0)
    else
      awful.tag.incmwfact(-0.025)
    end
  end, {description = "Floating Resize Horizontal -", group = "client"}),
  
  
  -- Resize Horizontaly Right
  awful.key({ modkey, alt }, "Right", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0,  10, 0)
    else
      awful.tag.incmwfact(0.025)
    end
  end, {description = "floating resize horizontal +", group = "client"}),

  -- With l
  awful.key({ modkey, alt }, "l", function()
    local cli = client.focus
    if cli.floating then
      cli:relative_move( 0, 0, 10, 0)
    else
      awful.tag.incmwfact(0.025)
    end
  end, {description = "Floating Resize Horizontal -", group = "client"}),
  

  -- Set focus as vertivcal or horizontal
  awful.key({ modkey , alt }, "b" , function() awful.tag.incnmaster( 1, nil, true ) end, 
            {description = "horizontal window", group = "layout"}),
  awful.key({ modkey, alt }, "v" , function() awful.tag.incnmaster( -1, nil, true ) end, 
            {description = "vertivcal window", group = "layout"}),

  -- Awesome stuff
	-- Show hotkeys
  awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	
  -- Restart
  awful.key({ modkey }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	
  -- Quit
  awful.key({ modkey, shift }, "q", awesome.quit, { description = "quit awesome", group = "awesome" })

)

-- Junp/Move to tag with numbers
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
              function ()
                    local screen = awful.screen.focused()
                    local tag = screen.tags[i]
                    if tag then
                        tag:view_only()
                    end
              end, {description = "view tag #"..i, group = "tag"}),
      
    -- Toggle tag display.
    awful.key({ modkey, ctrl }, "#" .. i + 9,
              function ()
                  local screen = awful.screen.focused()
                  local tag = screen.tags[i]
                  if tag then
                      awful.tag.viewtoggle(tag)
                  end
              end, {description = "toggle tag #" .. i, group = "tag"}),

    -- Move client to tag.
    awful.key({ modkey, shift }, "#" .. i + 9,
              function ()
                  if client.focus then
                      local tag = client.focus.screen.tags[i]
                      if tag then
                          client.focus:move_to_tag(tag)
                      end
                  end
              end, {description = "move focused client to tag #"..i, group = "tag"})
    
  )
end


clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Mouse Bindings
root.buttons(gears.table.join(
--    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

root.keys(globalkeys)
