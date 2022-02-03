
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local terminal = "kitty"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor
local modkey = "Mod4"
local menubar = require("menubar")
-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local editormenu = {
	{ "neovim", "wezterm start nvim" },
	{ "helix", "wezterm start helix" },
	{ "vscode", "code" },
}

local officemenu = {
	{ "files", "nemo" },
	{ "Word", "wps" },
	{ "Excel", "et" },
	{ "Power Point", "wpp" },
}

local networkmenu = {
	{ "edge", "microsoft-edge-stable" },
	{ "chrome", "google-chrome-stable" },
	{ "firefox", "firefox" },
	{ "nm-editor", "nm-connection-editor" },
}

local termmenu = {
	{ "kitty", "kitty" },
	{ "wezterm", "wezterm" },
	{ "alacritty", "alacritty" },
}

local multimediamenu = {
	{ "netease-cloud-music", "netease-cloud-music" },
	{ "yesplaymusic", "yesplaymusic" },
	{ "spotify", "spotify" },
	{ "ncmpcpp", terminal .. " -e ncmpcpp" },
	{ "vlc", "vlc" },
	{ "pulseaudio", "pavucontrol" },
}

local settingsmenu = {
	{ "lxappearance", "lxappearance" },
	{ "wallpaper settings", "nitrogen" },
	{ "qt5 settings", "qt5ct" },
}

local utilsmenu = {
	{ "screenshot", "flameshot gui" },
	{ "screenkey", "screenkey" },
}

local myexitmenu = {
	{
		"logout",
		function()
			awesome.quit()
		end,
	},
	{ "reboot", "sudo systemctl reboot" },
	{ "suspend", "sudo systemctl suspend" },
	{ "shutdown", "sudo systemctl poweroff" },
}

local mymainmenu = awful.menu({
	items = {
		{ "editors", editormenu },
		{ "terms", termmenu },
		{ "network", networkmenu },
		{ "office", officemenu },
		{ "multimedia", multimediamenu },
		{ "settings", settingsmenu },
		{ "utils", utilsmenu },
		{ "awesome", myawesomemenu },
		{ "exit options", myexitmenu },
	},
})

local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local markup = lain.util.markup

local cpu = lain.widget.cpu({
	timeout = 1,
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, beautiful.yellow, " " .. cpu_now.usage .. "%"))
	end,
})

local mem = lain.widget.mem({
	timeout = 1,
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, beautiful.blue, " " .. mem_now.perc .. "%"))
	end,
})

local systray = wibox.widget.systray()

local vol = lain.widget.alsa({
	timeout = 1,
	settings = function()
		if volume_now.status == "off" then
			volume_now.level = "Muted"
			widget:set_markup(markup.fontfg(beautiful.font, beautiful.grey, "婢 " .. volume_now.level))
		else
			widget:set_markup(markup.fontfg(beautiful.font, beautiful.pink, "奔 " .. volume_now.level .. "% "))
		end
	end,
})

vol.widget:buttons(awful.util.table.join(
	awful.button({}, 1, function() -- left click
		awful.spawn("pamixer -t")
		vol.update()
	end),
	awful.button({}, 3, function() -- middle click
		awful.spawn("pavucontrol")
	end),
	awful.button({}, 4, function() -- scroll up
		awful.spawn("pamixer -i 3")
		vol.update()
	end),
	awful.button({}, 5, function() -- scroll down
		awful.spawn("pamixer -d 3")
		vol.update()
	end)
))

local mpris = require("themes.default.mpris")
local mpd = require("themes.default.mpdarc")
local bat = require("themes.default.batteryarc-widget.batteryarc")
local spacer = wibox.widget.textbox(" ")

local tag1 = "  "
local tag2 = "  "
local tag3 = "  "
local tag4 = "  "
local tag5 = "  "
local tag6 = "  "
local tag7 = "  "
local tag8 = "  "
local tag9 = "  "

awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own tag table.
	awful.tag.add(tag1, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
		selected = true,
	})

	awful.tag.add(tag2, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	awful.tag.add(tag3, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	awful.tag.add(tag4, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	awful.tag.add(tag5, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	awful.tag.add(tag6, {
		layout = awful.layout.layouts[5],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	awful.tag.add(tag7, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	awful.tag.add(tag8, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	awful.tag.add(tag9, {
		layout = awful.layout.layouts[1],
		master_fill_policy = "master_width_factor",
		screen = s,
	})

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mpris(),
			spacer,
			-- mpd,
			-- spacer,
			cpu,
			spacer,
			mem,
			spacer,
			vol,
			spacer,
			bat(),
			mytextclock,
			systray,
			spacer,
			s.mylayoutbox,
		},
	})
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end)
	-- awful.button({}, 4, awful.tag.viewnext),
	-- awful.button({}, 5, awful.tag.viewprev)
))
-- }}}
