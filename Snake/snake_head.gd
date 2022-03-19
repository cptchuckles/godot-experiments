extends MeshInstance

func _ready() -> void:
	$body.grow_body_recursively(100)
