extends Node2D

export(String) var JSON_PATH

var point_a = Vector2(100, 200)
var point_b = Vector2(200, 100)

func _ready() -> void:
	var json_file = File.new()
	json_file.open(JSON_PATH, File.READ)
	var json_text = json_file.get_as_text()
	var json_data = JSON.parse(json_text)
	print(var2str(json_data), var2str(json_data.error), var2str(json_data.result))
	print(JSON.print(json_data.result), "\t")

	get_tree().quit()
