local volume = {}

local awful = require ("awful")
local wibox = require ("wibox")

-- Helper Function
local function cmd(command)
	awful.spawn.with_shell(command)
end

-- Local Varibales
local level = 16 -- initial level
local muted = false
local MIN = 0 -- minimum volume level of 'amixer plyback'
local MAX = 31 -- maximum volume level of 'amixer playback'
local STEP = 1 -- step to update volume level (up / down).
local widget = wibox.widget{
	markup = '',
	halign = "center",
	valign = "center",
	widget = wibox.widget.textbox
}

-- Local Fucntions
local function getmessage(value)
	return string.format(" vol:%-4s|", value)
end
local function updatewidget()
	levelperc = math.floor((level / MAX)*100)
	if(muted) then
		widget.markup = getmessage("M")
		return
	end
	widget.markup = getmessage(levelperc .. "%")
end

-- Update the widget to set an initial value
updatewidget()
--
local function updatelevel(val)
	level = level + val
	if(level > MAX) then
		level = MAX
	elseif (level < MIN) then
		level = MIN
	else
		return
	end
end

-- Public Functions
function volume.getwidget()
	return widget
end

function volume.up()
	cmd("pactl set-sink-volume @DEFAULT_SINK@ +" .. STEP .. "%")
	--cmd("amixer set Master playback " .. STEP .. "+")
	updatelevel(STEP)
	updatewidget()
end

function volume.down()
	cmd("pactl set-sink-volume @DEFAULT_SINK@ +" .. STEP .."%")
	--cmd("amixer set Master playback " .. STEP .. "-")
	updatelevel(-STEP)
	updatewidget()
end

-- Mute / Unmute
function volume.toggle()
	cmd("amixer set Master playback toggle")
	muted = not muted
	updatewidget()
end

return volume
