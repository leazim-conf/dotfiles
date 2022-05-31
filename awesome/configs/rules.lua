
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

-- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height 

awful.rules.rules = {
-- Global
  { rule = {},
		properties = {
			border_width = 1, 
      raise = true,
			size_hints_honor = false,
			honor_workarea = true,
			honor_padding = true,
			-- screen = awful.screen.preferred,
			screen = awful.screen.focused,
			focus = awful.client.focus.filter,
			titlebars_enabled = beautiful.titlebar_enabled,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		}
	},
	
  -- Float
  { id = "floating",
		rule_any = {
      instance = { },
			class = { "Lxappearance", },
			name = {
				"Event Tester", -- xev 
      },
			role = {
				"AlarmWindow",
				"pop-up",
				"conversation", },
			type = { "dialog", },
		},
		properties = { 
      floating = true,
      placement = awful.placement.centered, 
	  }
  },
}
