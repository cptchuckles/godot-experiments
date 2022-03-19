extends Node2D


export(NodePath) onready var target = get_node(target) as Sprite


func _ready() -> void:
	print("%s:global_position = %s" % [target.get_path(), var2str(target.global_position)])
