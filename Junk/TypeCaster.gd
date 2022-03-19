extends Area2D

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")


func _on_body_entered(body: KinematicBody2D) -> void:
	if !body:
		print("Body entered that wasn't a KinematicBody2D")
		return
	print(body.name)
