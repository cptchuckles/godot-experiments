extends Area

func _on_Area_entered(area: Area) -> void:
  print(name + " entered by " + area.name)
