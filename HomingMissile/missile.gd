extends RigidBody2D

export(float) var TERMINAL_VELOCITY := 200.0
export(float) var CONSTANT_THRUST := 5.0
export(float) var TURN_STRENGTH := 5.0

export(NodePath) var NOSE_POSITION2D: NodePath
onready var NOSE := get_node(NOSE_POSITION2D) as Node2D
export(NodePath) var TARGET_NODE2D: NodePath
onready var TARGET := get_node(TARGET_NODE2D) as Node2D
export(NodePath) var FLAMES_GRAPHIC: NodePath
onready var flames := get_node(FLAMES_GRAPHIC) as Node2D

onready var target_last_position := TARGET.global_position


func _physics_process(delta: float) -> void:
	var target_position = TARGET.global_position + (TARGET.global_position - target_last_position)/delta
	target_last_position = TARGET.global_position

	var direction: Vector2 = NOSE.global_position.direction_to(target_position - linear_velocity)
	var attenuate_turning: float = global_transform.y.dot(direction)
	apply_torque_impulse(TURN_STRENGTH * attenuate_turning)

	var apply_thrust := Vector2()
	if linear_velocity.dot(direction.normalized()) < TERMINAL_VELOCITY:
		var attenuate_thrust: float = clamp(global_transform.x.dot(direction), 0, 1)
		apply_thrust = global_transform.x * CONSTANT_THRUST * attenuate_thrust
		apply_central_impulse(apply_thrust)

	if flames:
		flames.scale.y = apply_thrust.length() / 100
