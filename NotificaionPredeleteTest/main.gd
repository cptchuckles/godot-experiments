extends Control


export(NodePath) var ICON_OF_SIN: NodePath
onready var icon: Node = get_node(ICON_OF_SIN)


func _ready() -> void:
	assert(is_instance_valid(icon), "THE LONGER THE ICON OF SIN IS ON EARTH, THE STRONGER HE *WILL* BECOME")


func _on_TreePresence_pressed() -> void:
	if not is_instance_valid(icon): return

	if icon.is_inside_tree():
		icon.get_parent().remove_child(icon)
	else:
		get_tree().current_scene.add_child(icon)


func _on_Delet_pressed() -> void:
	if not is_instance_valid(icon): return

	icon.queue_free()
	icon = null
