extends KinematicBody2D


export(float) var SPEED := 200.0
var velocity := Vector2()
var selectable := true
var selected := false


func _ready() -> void:
	var T := global_transform
	set_as_toplevel(true)
	global_transform = T
	print(get_parent() is Sprite)


func _process(_delta: float) -> void:
	DebugDraw.set_text("velocity", velocity)


func _physics_process(_delta) -> void:
	get_parent().global_position = self.global_position
	movement_input()
	move_and_slide(velocity * SPEED)


func movement_input() -> void:
	if Input.is_mouse_button_pressed(1):
		if selectable:
			selected = true
		else:
			selected = false
			get_node("../Sprite").modulate = Color.white
	velocity = Vector2.ZERO
	if selected:
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		velocity = velocity.normalized()
