hl.window_rule({
	name = "tile-all",
	match = { class = ".*" },
	tile = true,
})

-- hl.window_rule({ name = "opaque-all", match = { class = ".*" }, opacity = "1" })

hl.window_rule({
	name = "float-popups-by-class",
	match = { class = "^(popup)$" },
	float = true,
})

hl.window_rule({
	name = "float-context-menu-by-title",
	match = { title = "^(context_menu)$" },
	float = true,
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "chrome-beta-maximized-state",
	match = { class = "^google-chrome-beta$" },
	fullscreen_state = "1 1",
})
