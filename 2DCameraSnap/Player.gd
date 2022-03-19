extends KinematicBody2D

export(float) var SPEED = 16	#pixels per second

func _process(_delta: float) -> void:
	var m_h := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var m_v := Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var move := Vector2(m_h, m_v).normalized()
	move_and_slide(move * SPEED)
