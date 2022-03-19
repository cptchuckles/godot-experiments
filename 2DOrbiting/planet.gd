extends Sprite

export var ORBIT_SPEED: float = PI
onready var orbit_range: float = position.length()
var t: float = 0.0

func _process(delta: float) -> void:
	t = fposmod(t + delta * ORBIT_SPEED * (cos(t)*0.3 + 1.0), 2*PI)

	position.x = sin(t) * orbit_range
	position.y = sin(t) * orbit_range/5 + cos(t)*orbit_range/3
	scale = Vector2.ONE * (1.0 + cos(t)*0.5)

	z_index = int(round(cos(t)))
