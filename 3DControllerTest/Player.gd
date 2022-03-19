extends KinematicBody


export var gravity = Vector3.DOWN * 10
export var speed = 4
export var rot_speed = 0.85

var velocity = Vector3.ZERO


func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("move_back"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("move_left"):
		rotate_y(rot_speed * delta)
	if Input.is_action_pressed("move_right"):
		rotate_y(-rot_speed * delta)
	
	velocity.y = vy


func _physics_process(delta):
	velocity += gravity * delta
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)
