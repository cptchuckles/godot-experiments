extends Sprite


export(float) var SPEED := 200.0

export(bool) var control_active := false setget set_active, get_active
func set_active(new_value: bool) -> void:
	control_active = new_value
	modulate = Color.white if control_active else Color.darkgray
func get_active() -> bool:
	return control_active


func _ready() -> void:
	set_active(control_active)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		set_active(!control_active)
	
	if not control_active: return

	global_position += Input.get_vector(
			"move_left","move_right", "move_forward","move_back", 0.2
			) * SPEED * delta
