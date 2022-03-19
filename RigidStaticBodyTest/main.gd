extends Node2D


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
	
	if event is InputEventKey and not event.echo and event.pressed:
		var numkey = event.scancode - KEY_1
		if numkey in range(4):
			$wall.mode = numkey
			print("wall set to mode %s" % ["RIGID", "STATIC", "CHARACTER", "KINEMATIC"][numkey])
