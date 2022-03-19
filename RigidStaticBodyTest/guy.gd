extends KinematicBody2D

export var DEADZONE: float = 0.2
export var SPEED: float = 40.0

func _physics_process(_delta: float) -> void:
	var _fuck = move_and_slide(
			Input.get_vector("ui_left","ui_right", "ui_up","ui_down", DEADZONE) * SPEED
			)
