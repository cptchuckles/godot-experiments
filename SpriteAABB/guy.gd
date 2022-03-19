extends Sprite

var drag: bool = false
var lever := Vector2.ZERO


func _ready() -> void:
	get_viewport().connect("size_changed", self, "_on_ViewPort_size_changed")


func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			if event.pressed:
				if not drag:
					lever = get_global_mouse_position() - global_position
				drag = true
			else:
				drag = false

		elif event is InputEventMouseMotion and drag:
			var current := get_global_mouse_position() - global_position
			var previous: Vector2 = current - event.relative
			global_scale *= current.length() / previous.length()
			global_rotation += previous.normalized().angle_to(current.normalized())

	elif Input.is_action_just_pressed("ui_accept"):
		global_rotation = 0
		global_scale = Vector2.ONE


func _process(delta: float) -> void:
	DebugDraw.set_text("global_rotation", rad2deg(global_rotation))
	DebugDraw.set_text("global_scale", global_scale)


func _on_ViewPort_size_changed() -> void:
	global_position = get_viewport().size / 2
