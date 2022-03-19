extends Area2D


func _ready() -> void:
	connect("area_entered", self, "_on_Area2D_area_entered")
	connect("area_exited", self, "_on_Area2D_area_exited")


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_select"):
		monitoring = true


func _on_Area2D_area_entered(area: Area2D) -> void:
	print("Area entered: ", area.name, " monitors: ", [monitoring, area.monitoring])


func _on_Area2D_area_exited(area: Area2D) -> void:
	print("Area exited: ", area.name, " monitors: ", [monitoring, area.monitoring])
	set_deferred("monitoring", false)
