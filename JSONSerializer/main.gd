extends Spatial

onready var thing = preload("res://JSONSerializer/cube.tres")

func _ready() -> void:
	print(JSON.print(thing, "\t"))
