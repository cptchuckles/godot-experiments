class_name Thing extends Node2D


func _ready() -> void:
	print("henlo i am %s and my rotation is %.3f and my position is %s" % [
			get_path(),
			$sprite.rotation,
			var2str($sprite.position) ])
	set_as_toplevel(true)
