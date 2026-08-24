hl.bind("SUPER + left", hl.dsp.focus({direction = "left"}))
hl.bind("SUPER + right", hl.dsp.focus({direction = "right"}))
hl.bind("SUPER + up", hl.dsp.focus({direction = "up"}))
hl.bind("SUPER + down", hl.dsp.focus({direction = "down"}))

hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({direction = "left"}))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({direction = "right"}))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({direction = "up"}))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({direction = "down"}))

hl.bind("SUPER + CTRL + left", hl.dsp.exec_raw("resizeactive -50 0"), {repeating = true})
hl.bind("SUPER + CTRL + right", hl.dsp.exec_raw("resizeactive 50 0"), {repeating = true})
hl.bind("SUPER + CTRL + up", hl.dsp.exec_raw("resizeactive 0 -50"), {repeating = true})
hl.bind("SUPER + CTRL + down", hl.dsp.exec_raw("resizeactive 0 50"), {repeating = true})

hl.bind("SUPER + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + D", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.exec_cmd("wofi --show drun -I"))
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + H", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + B", hl.dsp.exec_cmd("floorp"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("zeditor"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("thunderbird"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("steam"))
hl.bind("SUPER + A", hl.dsp.exec_cmd("anki"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({workspace = i}))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({workspace = i}))
end

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"))

hl.bind("SUPER + mouse_down", hl.dsp.focus({workspace = "e+1"}))
hl.bind("SUPER + mouse_up", hl.dsp.focus({workspace = "e-1"}))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {mouse = true})
