extends Node


func _init() -> void:
	print(name, "got created!")


func _ready() -> void:
	print(name, "got added to scene tree!")


func print_the_tree() -> void:
	print(var2str(get_tree()))
