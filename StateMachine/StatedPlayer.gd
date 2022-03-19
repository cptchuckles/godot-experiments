extends KinematicBody2D


enum {
	STATE_IDLE,
	STATE_MOVE,
	STATE_SWELL,
}


export(float) var TOPDOWN_MOVE_SPEED := 400.0
export(float) var SIDESCROLL_MOVE_SPEED := 200.0
export(float) var SIDESCROLL_GRAVITY := 800.0
export(float) var SIDESCROLL_JUMP_STRENGTH := 0.7
export(float) var SIDESCROLL_FALL_MULTIPLIER := 3.5

var state: int = STATE_IDLE


class MoveState extends Reference:
	var _speed: float
	var __velocity := Vector2()

	func _init(speed:float = 200.0).() -> void:
		_speed = speed

	func move(body:KinematicBody2D, input:Vector2, delta:float) -> void:
		pass


class MoveStateTopdown extends MoveState:
	var __looking := Vector2.RIGHT

	func _init(speed: float = 200.0).(speed) -> void: pass

	func move(body:KinematicBody2D, input:Vector2, delta:float) -> void:
		assert(is_instance_valid(body), "body invalid")
		if input.length() > 0:
			if is_equal_approx(input.normalized().dot(__looking), -1):
				input = body.global_transform.y * (1 if randi()%2 else -1)
			__looking = __looking.slerp(input.normalized(), 0.4)
			body.look_at(body.global_position + __looking)
		__velocity = __looking.normalized() * input.length() * _speed
		__velocity = body.move_and_slide(__velocity)


class MoveStateSidescroller extends MoveState:
	var _gravity:float
	var _jump_strength:float
	var _coyote_time:float
	var _fall_multiplier:float

	var __can_jump := false
	var __was_grounded := false

	func _init(
			speed:float = 200.0,
			gravity:float = 20.0,
			jump_strength:float = 0.7,
			fall_multiplier:float = 2.0,
			coyote_time:float = 0.2).(speed) -> void:
		_gravity = gravity
		_jump_strength = gravity * jump_strength
		_fall_multiplier = fall_multiplier
		_coyote_time = coyote_time

	func move(body:KinematicBody2D, input:Vector2, delta:float) -> void:
		assert(is_instance_valid(body), "body invalid")

		if body.is_on_floor():
			__can_jump = true
			__was_grounded = true
			__velocity.x = input.x * _speed
		else:
			__velocity.x = lerp(__velocity.x, input.x * _speed, 0.08)
			if __was_grounded:
				__was_grounded = false
				body.get_tree().create_timer(_coyote_time).connect("timeout", self, "set", ["__can_jump", false])

		if __can_jump and Input.is_action_just_pressed("jump"):
			__can_jump = false
			__velocity.y = -_jump_strength

		__velocity.y += _gravity * delta * (
				1 if __velocity.y < 0 and Input.is_action_pressed("jump") else _fall_multiplier
				)
		__velocity = body.move_and_slide(__velocity, Vector2.UP)


onready var move_state_topdown := MoveStateTopdown.new(TOPDOWN_MOVE_SPEED)
onready var move_state_sidescroll := MoveStateSidescroller.new(
		SIDESCROLL_MOVE_SPEED,
		SIDESCROLL_GRAVITY,
		SIDESCROLL_JUMP_STRENGTH,
		SIDESCROLL_FALL_MULTIPLIER
		)
onready var move_state: MoveState = move_state_topdown


var input := Vector2()
func _process(delta: float) -> void:
	input = Input.get_vector("move_left", "move_right", "move_forward", "move_back", 0.2)

	match state:
		STATE_IDLE:
			rotate(deg2rad(120 * delta))
			if input.length() > 0:
				state = STATE_MOVE
				return
			if Input.is_action_just_pressed("ui_select"):
				state = STATE_SWELL
				return
		STATE_MOVE:
			if Input.is_action_just_pressed("ui_cancel"):
				state = STATE_IDLE
				return
			if Input.is_action_just_pressed("ui_select"):
				if move_state is MoveStateTopdown:
					move_state = move_state_sidescroll
				elif move_state is MoveStateSidescroller:
					move_state = move_state_topdown
		STATE_SWELL:
			scale = Vector2.ONE * (1 + sin(deg2rad(Engine.get_idle_frames()/10.0))*0.5 )
			if Input.is_action_just_pressed("ui_cancel"):
				state = STATE_IDLE


func _physics_process(delta:float) -> void:
	match state:
		STATE_MOVE:
			move_state.move(self, input, delta)
