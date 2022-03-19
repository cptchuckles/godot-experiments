extends Label

var count := 0
var time := 0.0
var tminus := Timer.new()

func _ready() -> void:
	tminus.wait_time = 1.0 / Engine.iterations_per_second
	tminus.one_shot = false
	tminus.connect("timeout", self, "_increase_count")
	add_child(tminus)
	tminus.start()

func _increase_count() -> void:
	count += 1

func _physics_process(delta: float) -> void:
	time += delta
	text = \
			"""
			%.03f running time
			%.03f countdown
			%d frames
			""" % [time, tminus.time_left, count]
