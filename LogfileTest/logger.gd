extends Node


const LOGFILE := "user://stupid_godot_log_file.log"
var logfile := File.new()


func _ready() -> void:
	if logfile.open(LOGFILE, File.WRITE) != OK:
		push_error("Couldn't open %s" % LOGFILE)
		get_tree().quit(1)
	else:
		self.log("Log file opened")


func log(msg: String) -> void:
	logfile.store_string(msg)


func _tree_exiting() -> void:
	logfile.close()
