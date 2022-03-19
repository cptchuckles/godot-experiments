extends Node2D


func _ready() -> void:
	print(get_tree().current_scene.filename)
	print(var2str(OS.get_cmdline_args()))
	print(get_tree().current_scene.filename in OS.get_cmdline_args())
	get_tree().quit()
