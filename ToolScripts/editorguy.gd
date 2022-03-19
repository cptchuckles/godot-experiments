tool
extends Sprite


func _init() -> void:
	print("I AM INITIATED")


func _enter_tree() -> void:
	set_process_input(true)
	set_process_unhandled_input(true)
	print("i am ready")


func _input(event: InputEvent) -> void:
	print("FUCK")
