local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local hotkeys_popup = require("awful.hotkeys_popup")
local apps = require("configs.apps")

-- Import configuration stuff
require("configs.keymap")
require("configs.rules")
