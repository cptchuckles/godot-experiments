extends Node2D


func _input(event: InputEvent) -> void:
	#print(var2str(event))
	if event is InputEventJoypadMotion:
		print("YEET")
	if event is InputEventJoypadButton:
		print("buton")

func _process(_delta: float) -> void:
	DebugDraw.set_text("move_right", Input.get_action_raw_strength("move_right", true))
