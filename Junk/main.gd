extends Node2D


var static_methods_script = preload("res://Junk/static_methods.gd")


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_WHEEL_UP: print("FUCK")
	if event.is_action_pressed("ui_accept"): print("ui_accept is pressed!!!!!!!!!1")
	if event.is_action_pressed("scroll_up"): print("SCROLLED UP BITCH")


func _ready() -> void:
	static_methods_script.do_thing_static()
	static_methods_script.do_thing_regular()

	var a: Dictionary = {"one": 1, "two": 2, "yeet": {"asdf": "wee"}, "four": 3}
	var b: Dictionary = a.duplicate(true)
	print(a["yeet"] == b["yeet"])
	print_input_map()

	var newthing = ThingFactory.make(Transform2D(PI/3, Vector2(500,200)))
	add_child(newthing)
	newthing.add_child(ThingFactory.make())
	newthing.queue_free()


func print_input_map() -> void:
	var lines: PoolStringArray
	for action in InputMap.get_actions():
		var new_line = "%s: " % action
		var events: PoolStringArray

		for event in InputMap.get_action_list(action):
			var event_string: String
			if event is InputEventJoypadButton:
				match event.button_index:
					JOY_XBOX_A: event_string = "Xbox A"
					JOY_XBOX_B: event_string = "Xbox B"
					JOY_XBOX_X: event_string = "Xbox X"
					JOY_XBOX_Y: event_string = "Xbox Y"
					JOY_DPAD_UP: event_string = "D-Up"
					JOY_DPAD_DOWN: event_string = "D-Down"
					JOY_DPAD_RIGHT: event_string = "D-Right"
					JOY_DPAD_LEFT: event_string = "D-Left"
					_: event_string = "JoypadButton #%d" % event.button_index
			elif event is InputEventJoypadMotion:
				match event.axis:
					JOY_ANALOG_LX: event_string = "LeftStick %sX" % ("+" if event.axis_value > 0 else "-")
					JOY_ANALOG_LY: event_string = "LeftStick %sY" % ("+" if event.axis_value > 0 else "-")
					JOY_ANALOG_RX: event_string = "RightStick %sX" % ("+" if event.axis_value > 0 else "-")
					JOY_ANALOG_RY: event_string = "RightStick %sY" % ("+" if event.axis_value > 0 else "-")
					_: event_string = event.as_text()
			elif event is InputEventMouseButton:
				match event.button_index:
					BUTTON_WHEEL_UP: event_string = "ScrollUp"
					BUTTON_WHEEL_DOWN: event_string = "ScrollDown"
					_: event_string = "MouseButton #%d" % event.button_index
			else:
				event_string = event.as_text()

			events.push_back(event_string)

		new_line += events.join("; ")
		lines.push_back(new_line)

	print(lines.join("\n\n"))
