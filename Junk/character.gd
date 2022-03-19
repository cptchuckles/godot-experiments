extends Sprite


var STEP setget set_step, get_step
func set_step(new_value):
	STEP = new_value
	print("%s set STEP to %s" % [get_path(), var2str(new_value)])
func get_step():
	return STEP


func _ready() -> void:
	add_to_group("characters")


func _process(_delta: float) -> void:
	print("YEET!")
	queue_free()
