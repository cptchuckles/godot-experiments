extends Sprite


export(float) var SPEED := 200.0


func _process(delta: float) -> void:
	global_position += Input.get_vector("move_left","move_right", "move_forward","move_back", 0.2) * SPEED * delta
	rotation += PI * delta
