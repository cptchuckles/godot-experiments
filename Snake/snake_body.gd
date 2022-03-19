extends MeshInstance

onready var offset: float = transform.origin.length()


func grow_body_recursively(segments: int) -> void:
	if segments > 0:
		var body_piece = self.duplicate()
		add_child(body_piece)
		body_piece.grow_body_recursively(segments - 1)
	set_as_toplevel(true)


func _process(_delta: float) -> void:
	var porridge: Vector3 = get_parent().global_transform.origin  # Parent ORIGin. Porridge.
	var direction: Vector3 = porridge.direction_to(global_transform.origin)
	global_transform.origin = porridge + direction*offset
	look_at(porridge, Vector3.UP)
