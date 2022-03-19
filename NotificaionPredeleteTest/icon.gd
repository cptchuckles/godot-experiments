extends Sprite


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_ENTER_TREE:
			print("hElLO")
		NOTIFICATION_EXIT_TREE:
			print("пока пока")
		NOTIFICATION_PREDELETE:
			print("FUCK!!!!!!!")
		NOTIFICATION_PROCESS:
			position.x += 0.1


func _process(_delta: float) -> void:
	pass
