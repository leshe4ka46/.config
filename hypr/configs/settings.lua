hl.config({
	input = {
		kb_layout = "us, ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:caps_toggle,grp_led:caps,caps:none",
		kb_rules = "",

		repeat_delay = 200,
		repeat_rate = 40,
		follow_mouse = 1,

		touchpad = {
			natural_scroll = false,
		},

		sensitivity = 0,
	},

	misc = {
		disable_hyprland_logo = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
