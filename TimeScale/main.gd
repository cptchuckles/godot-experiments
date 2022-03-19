extends Node2D

export(float, 0.0, 1.0) var TIME_SCALE := 1.0

func _ready() -> void:
	Engine.time_scale = TIME_SCALE
