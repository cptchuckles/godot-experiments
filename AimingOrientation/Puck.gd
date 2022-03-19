extends MeshInstance


export var SPEED: float = 5.0
onready var cam := get_viewport().get_camera()

onready var depth: float = -global_transform.origin.y


func _physics_process(delta: float) -> void:
	var plane := Plane(Vector3.UP, depth)
	var cam_shooty_ray: Vector3 = cam.project_ray_normal(get_viewport().get_mouse_position())
	var cursorpos := plane.intersects_ray(cam.global_transform.origin, cam_shooty_ray)
	global_transform.origin = global_transform.origin.linear_interpolate(cursorpos, 0.2)

	if Input.is_key_pressed(KEY_Q):
		depth += SPEED * delta
	if Input.is_key_pressed(KEY_E):
		depth -= SPEED * delta
