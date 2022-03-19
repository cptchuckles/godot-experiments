extends KinematicBody
class_name Player

export var gravity = -25
export var walk_speed = 6
export var sprint_speed = 8
export var mouse_sensitivity = 0.003  # radians/pixel
export var velocity = Vector3.ZERO

onready var camera = $Head
onready var movement_speed = walk_speed

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func get_movement_dir():
	var input_dir = Vector3()

	if Input.is_action_pressed("move_forward"):
		input_dir += -global_transform.basis.z
	
	if Input.is_action_pressed("move_back"):
		input_dir += global_transform.basis.z
	
	if Input.is_action_pressed("move_left"):
		input_dir += -global_transform.basis.x
	
	if Input.is_action_pressed("move_right"):
		input_dir += global_transform.basis.x
	
	input_dir = input_dir.normalized()
	return input_dir

func _input(event) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Head.rotate_x(-event.relative.y * mouse_sensitivity)
		$Head.rotation.x = clamp($Head.rotation.x, -1.2, 1.2)

func _process(_delta) -> void:
	if Input.is_action_pressed("sprint"):
		movement_speed = sprint_speed
	else:
		movement_speed = walk_speed

func _physics_process(delta) -> void:
	
	velocity.y += gravity * delta
	
	var desired_velocity = get_movement_dir() * movement_speed

	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
