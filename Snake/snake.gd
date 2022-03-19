extends Spatial

export(float) var DEADZONE   :=  2.0
export(float) var MOVE_SPEED := 20.0

var move := Vector2()
onready var view := get_viewport()
onready var cam := view.get_camera()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.relative.length() > DEADZONE:
			move = event.relative


func _process(delta: float) -> void:
	var go := global_transform.origin
	var head_to_view := cam.unproject_position(go)
	var move_from_head := head_to_view + move
	var move_to_ray := cam.project_ray_normal(move_from_head)
	var move_to := Plane.PLANE_XZ.intersects_ray(cam.global_transform.origin, move_to_ray)
	global_transform.origin = go.move_toward(move_to, MOVE_SPEED * delta)

	move = Vector2.ZERO
