extends Sprite

export var SENSITIVITY : float = 90.0

var _mouse_delta: float = 0.0


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_mouse_delta = $icon.global_transform.y.dot(event.relative.clamped(1.0))


func _process(delta: float) -> void:
	rotation_degrees = fposmod(rotation_degrees + _mouse_delta * SENSITIVITY * delta, 360.0)
	_mouse_delta = 0.0
