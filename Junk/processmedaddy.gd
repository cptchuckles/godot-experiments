extends Node2D


func _ready() -> void:
	var t := Timer.new()
	t.wait_time = 1.0
	t.one_shot = false
	t.connect("timeout", self, "_on_t_timeout")
	add_child(t)
	t.start()


func _process(_delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action("ui_accept") and Input.is_action_just_pressed("ui_accept"):
		#set_process(!is_processing())  # this doesn't stop the branch, only self
		propagate_call("set_process", [!is_processing()], true)  # this stops the branch's _process methods but not timers
		print("Process mode for %s has %s" % [name, "started" if is_processing() else "stopped"])
	elif event is InputEventKey and event.pressed and not event.echo:
		var character: PoolByteArray
		character.append(event.unicode)
		print("%s key just pressed!" % character.get_string_from_utf8())


func _on_t_timeout() -> void:
	print("FUCK")
