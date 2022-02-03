
-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},
	{
		rule_any = { class = { "org.wezfurlong.wezterm", "kitty" } },
		properties = {},
		callback = awful.client.setslave,
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"jetbrains-toolbox",
				"Wine",
				"wechat.exe",
				"Lxappearance",
				"Nitrogen",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	{ rule = { class = "Microsoft-edge" }, properties = { screen = 1, tag = tag1 } },
	{ rule = { class = "Typora" }, properties = { screen = 2, tag = tag1 } },

	{ rule = { class = "jetbrains-webstorm" }, properties = { screen = 1, tag = tag2 } },
	{ rule = { class = "jetbrains-pycharm" }, properties = { screen = 1, tag = tag2 } },

	{ rule = { class = "Google-chrome" }, properties = { screen = 1, tag = tag3 } },

	{ rule = { instance = "music" }, properties = { screen = 1, tag = tag4 } },
	{ rule = { class = "Spotify" }, properties = { screen = 1, tag = tag4 } },
	{ rule = { class = "yesplaymusic" }, properties = { screen = 1, tag = tag4 } },
	{ rule = { class = "netease-cloud-music" }, properties = { screen = 2, tag = tag4 } },

	{ rule = { class = "Steam" }, properties = { screen = 2, tag = tag5 } },

	{ rule = { class = "Wine" }, properties = { screen = 1, tag = tag6 } },
	{ rule = { class = "wechat.exe" }, properties = { screen = 1, tag = tag6 } },
	{ rule = { class = "TelegramDesktop" }, properties = { screen = 2, tag = tag6 } },

	{ rule = { class = "Solaar" }, properties = { screen = 1, tag = tag7 } },
	{ rule = { class = "qBittorrent" }, properties = { screen = 1, tag = tag7 } },
	{ rule = { class = "Clash for Windows" }, properties = { screen = 2, tag = tag7 } },

	{ rule = { class = "winedbg.exe" }, properties = { screen = 1, tag = tag9 } },
}
-- }}}
