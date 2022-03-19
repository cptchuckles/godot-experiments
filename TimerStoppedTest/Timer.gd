extends Timer

func _ready() -> void:
	connect("timeout", self, "beep")

func _input(_e: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if is_stopped():
			start()
		else:
			print("NO RESTARTING THE TIMER!")

func _process(_delta: float) -> void:
	print(is_stopped(), time_left)

func beep() -> void:
	print(" ------------------------ beep!")
