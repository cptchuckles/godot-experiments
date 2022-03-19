extends Node2D


export(float) var STEP := 7.0

var moves = 5


func _ready() -> void:
	get_node("Counter").set_text("moves left:"+str(moves))
	get_tree().set_group("characters", "STEP", STEP)
