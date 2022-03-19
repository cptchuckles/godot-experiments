extends Sprite


onready var loaded_script : Node = preload("res://TestPreloadGetTree/preload-me-daddy.gd").new() as Node

func _ready() -> void:
	add_child(loaded_script)
	loaded_script.print_the_tree()
	get_tree().quit()
