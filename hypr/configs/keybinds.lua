local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd([[ungoogled-chromium --proxy-server="socks5://127.0.0.1:1080"]]))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("hiddify"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("keepass"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("kitty spotify_player"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("killall -9 Telegram"))
hl.bind(
	mainMod .. " + O",
	hl.dsp.exec_cmd("OBSIDIAN_USE_WAYLAND=1 obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland")
)
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("plasma-emojier"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grimblast --freeze copy area"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("steam"))

hl.bind(
	mainMod .. " + A",
	hl.dsp.exec_cmd(
		'~/wireshark-ecpri-gsm/build/run/wireshark -f "not (udp port 5702 or udp port 5802 or udp port 6702 or udp port 6802)" -i any'
	)
)
hl.bind(
	mainMod .. " + SHIFT + A",
	hl.dsp.exec_cmd(
		'~/wireshark-ecpri-gsm/build/run/wireshark -f "not (udp port 5702 or udp port 5802 or udp port 6702 or udp port 6802)" -i any -k'
	)
)

hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("wofi"))

hl.bind("ALT + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next({ next = true }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

hl.bind("ALT + SHIFT + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next({ prev = true }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_next_mon.sh"))

hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(
	"Print",
	hl.dsp.exec_cmd("grimblast --freeze copy screen ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%s).png")
)
hl.bind(
	"SHIFT + Print",
	hl.dsp.exec_cmd("grimblast --freeze copy area ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%s).png")
)

hl.bind("code:121", hl.dsp.exec_cmd("pamixer -t"), { locked = true })
hl.bind("code:122", hl.dsp.exec_cmd("pamixer -d 2"), { locked = true, repeating = true })
hl.bind("code:123", hl.dsp.exec_cmd("pamixer -i 2"), { locked = true, repeating = true })
hl.bind("code:256", hl.dsp.exec_cmd("pamixer --default-source -t"), { locked = true })
hl.bind("code:232", hl.dsp.exec_cmd("brightnessctl set 2%-"), { locked = true, repeating = true })
hl.bind("code:233", hl.dsp.exec_cmd("brightnessctl set 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + equal", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + minus", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- hl.bind("Escape", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-screen.sh"), { locked = true })
