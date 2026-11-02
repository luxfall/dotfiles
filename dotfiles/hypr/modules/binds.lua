
---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "foot"
local fileManager = "dolphin"
local menu = "noctalia msg panel-toggle launcher"


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + Up",  hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + K",  hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + Left",  hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + H",  hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + Right", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + L", hl.dsp.layout("focus r"))

hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + H",  hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))

hl.bind(mainMod .. " + CTRL + Left",  hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + CTRL + H",  hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + CTRL + Right", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.layout("move +col"))

hl.bind(mainMod .. " + Minus", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + Equal", hl.dsp.layout("colresize +0.1"))
hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"))

hl.bind(mainMod .. " + bracketleft", hl.dsp.layout("expel"))
hl.bind(mainMod .. " + bracketright", hl.dsp.layout("consume"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + period", hl.dsp.layout("consume_or_expel next"))

hl.bind(mainMod .. " + C", hl.dsp.layout("fit active"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.layout("fit visible"))
hl.bind(mainMod .. " + CTRL + C", hl.dsp.layout("fit all"))

hl.bind(mainMod .. " + S", hl.dsp.layout("inhibit_scroll"))

hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 0}))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1}))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2}))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3}))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4}))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5}))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6}))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7}))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8}))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9}))

hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 0}))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1}))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2}))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3}))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4}))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5}))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6}))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7}))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8}))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9}))

hl.bind(mainMod .. " + F", hl.dsp.layout("fit active"))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

