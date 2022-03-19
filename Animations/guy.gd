extends Node2D

onready var line = $Line2D

func _process(_delta) -> void:
  line.clear_points()
  line.add_point(global_position - line.global_position)
  line.add_point(get_viewport().get_mouse_position() - line.global_position)
