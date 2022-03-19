extends KinematicBody2D


export(float) var SPEED := 200.0


var motion := Vector2()


func _physics_process(_delta: float) -> void:
	var h: float = Input.get_axis("move_left", "move_right")

	if not is_equal_approx(h, 0):
		global_transform.x = Vector2.RIGHT * sign(h)

	DebugDraw.set_text("global_transform", global_transform)

	motion = Vector2(h, 0.0) * SPEED
	move_and_slide(motion)
