extends AnimatedSprite


func _ready() -> void:
	connect("animation_finished", self, "fuck")
	play("default", true)

func fuck() -> void:
	print("FUCK")
