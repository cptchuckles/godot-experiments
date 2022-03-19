extends Node2D

var map := false


func _ready() -> void:
	InputMap.add_action("fuck", 0)


func _input(event: InputEvent) -> void:
	if event.is_action("ui_accept"): return

	if map and event is InputEventKey:
		InputMap.action_add_event("fuck", event)
		map = false
		print("MAPPED")
	
	if event is InputEventKey and event.is_action_pressed("move_left"):
		if event.shift:
			print("Shift A")
		else:
			print("regular a")
	
	if event is InputEventKey and event.is_action_pressed("fuck"):
		print("FUCK")


func _process(_delta: float) -> void:
	DebugDraw.set_text("a", Input.is_key_pressed(KEY_A))
	DebugDraw.set_text("shift", Input.is_key_pressed(KEY_SHIFT))
	if Input.is_action_just_pressed("ui_accept"):
		map = true
		print("Now mapping...")
