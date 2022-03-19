extends Sprite


export(Array, NodePath) var RED_CHILDREN: Array


func _ready() -> void:
	for c in RED_CHILDREN:
		get_node(c).set_as_toplevel(true)
