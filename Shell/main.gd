extends Node2D


func _ready() -> void:
	var output = []
	var ret = OS.execute("Shell/test.sh", [], true, output, true)
	print_debug(var2str(output))
	if ret != OK:
		push_error("Program returned %d" % ret)
	OS.execute("/bin/bash", ["-c", "sleep 5 && notify-send 'You' 'are a bitch nugget'"], false, [])
	print(ProjectSettings.get_setting("application/run/main_loop_type"))
	get_tree().quit()
