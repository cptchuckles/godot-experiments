extends KinematicBody


export var TARGET_NODE: NodePath
onready var TARGET : Spatial = get_node_or_null(TARGET_NODE) as Spatial

export var TURN_FACTOR: float = 0.2
export var PITCH_STOP_ANGLE: float = 20.0  # minimum degrees away from Y-Axis

onready var head := $Head as Spatial


func _physics_process(delta: float) -> void:
	if ! TARGET: return

	var targ_basis: Basis = head.global_transform.looking_at(TARGET.global_transform.origin, Vector3.UP).basis

	var yaw_x := targ_basis.x
	var yaw_y := Vector3.UP
	var yaw_z := yaw_x.cross(yaw_y)
	var yaw_basis := Basis(yaw_x, yaw_y, yaw_z)
	global_transform.basis = global_transform.basis.slerp(yaw_basis, TURN_FACTOR)

	var pitch_angle: float = asin(targ_basis.y.dot(yaw_basis.z))
	var pitch_basis: Basis = global_transform.basis.rotated(global_transform.basis.x, pitch_angle)
	head.global_transform.basis = head.global_transform.basis.slerp(pitch_basis, TURN_FACTOR)
