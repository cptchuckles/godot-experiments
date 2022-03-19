extends Node


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().set_pause(!get_tree().is_paused())
