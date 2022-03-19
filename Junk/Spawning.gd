extends Node2D


func _ready() -> void:
	var new_thing = Sprite.new()
	new_thing.texture = $Icon.texture
	$Icon.add_child(new_thing)
	new_thing.global_position.x += 40
	new_thing.scale /= 2
	new_thing.transform = new_thing.global_transform
	new_thing.set_as_toplevel(true)
	print(get_children())
