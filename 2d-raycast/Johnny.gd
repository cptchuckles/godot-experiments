extends StaticBody2D

func _ready() -> void:
  print(name, " is ready")
  print(get_tree().root.name, ',', get_viewport().name)
