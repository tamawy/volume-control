### In the name of Allah.
# Awesome Volume Control
This is a simple module with <a href="https://www.lua.org/" target="_blank">lua</a> language that controls volume in <a href="https://awesomewm.org/" target="_blank">Awesome</a> window manager.
<br>
I created and used this modeule on <a href="https://archlinux.org/" target="_blank">Arch Linux</a>.

# Installation and Usage
1. Clone your project inside ~/.config/awesome (i.e. in the same directory with rc.lua)
```
cd ~/.config/awesome
git clone https://github.com/IbrahimElsayed26498/volume-control
```
2. Inside rc.lua
In the beginning of the file write:
```
local volume = require("volume-control.volume")
```
3. Inside (Right Widget) area call volume.getwidget
```
s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            volume.getwidget(), -- Add this line here
            mykeyboardlayout,
            mytextclock,
            -- s.mylayoutbox,
        },
    }
```
After previous steps, you have the volume value in you title bar.<br>

4. Let's make the keys works to make the volume up, down and mute/unmute<br>
We are still inside rc.lua<br>
In key binding area add.
```
   -- Volume
   awful.key({}, "XF86AudioRaiseVolume", function() volume.up() end,
             {description = "volume up", group = "volume"}),
   awful.key({}, "XF86AudioLowerVolume", function() volume.down() end,
             {description = "volume down", group = "volume"}),
   awful.key({}, "XF86AudioMute", function() volume.toggle() end,
             {descriptoin = "mute / unmute", group = "volume"})
```
Now save the file and reload awesome window manager.<br>
### You can use or modify it. Thank you. :)
