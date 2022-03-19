extends Area2D

func _ready() -> void:
	get_tree().create_timer(2).connect("timeout", self, "report")

	yield(get_tree(), "idle_frame")

	var johnny = preload("res://2d-raycast/Johnny.tscn").instance()
	print(get_tree().current_scene.name)
	get_tree().current_scene.add_child(johnny)
	johnny.global_position = $"../neanderthal".global_position + Vector2(80, 0)
	print(johnny.get_child(0).name, " has owner ", johnny.get_child(0).owner.name)


func report() -> void:
	var names = []
	for body in get_overlapping_bodies():
		names.push_back(body.name)

	print(var2str(names))
