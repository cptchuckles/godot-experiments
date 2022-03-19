extends Node2D


func _draw() -> void:
	for i in 143:
		if i % 2 == 0:
			draw_line(Vector2(0, i), Vector2(143, i), Color.black)
