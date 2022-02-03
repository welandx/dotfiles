
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/default/"

-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
beautiful.init(theme_dir .. "theme.lua")
-- Notification library
local naughty = require("naughty")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.

-- This is used later as the default terminal and editor to run.
local terminal = "kitty"
local editor = os.getenv("EDITOR") or "nvim"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.fair,
	awful.layout.suit.max,
	awful.layout.suit.floating,
	-- awful.layout.suit.tile,
	-- awful.layout.suit.tile.left,
	-- awful.layout.suit.tile.top,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
-- }}}


local km = "weland.keymap"
local wg = "weland.widget"

require(km)
require(wg)


-- Shell programs
local local_bin = os.getenv("HOME") .. "/.local/bin/"
local randr = local_bin .. "randr"
local weland_start = local_bin .. "weland_start"
local random_wall = "python " .. local_bin .. "nitrogen_randomizer.py " .. theme_dir .. "wallpapers"


local sg = "weland.signal"

require(sg)

--

awful.spawn.with_shell(randr)
awful.spawn.with_shell(random_wall)
awful.spawn.with_shell("picom --experimental-backends -b --config " .. theme_dir .. "conf/picom.conf")
awful.spawn.with_shell(weland_start)
awful.spawn.with_shell(
	'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;'
		.. 'xrdb -merge <<< "awesome.started:true";'
		.. "dex --environment Awesome --autostart"
)
