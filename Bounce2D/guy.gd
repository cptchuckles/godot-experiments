extends KinematicBody2D


export(float) var SPEED := 50.0
export(float, 0, 2) var DIRECTION := 0.75

onready var direction := Vector2.RIGHT.rotated(fposmod(DIRECTION*PI, TAU))


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * SPEED * delta)
	if collision:
		direction = direction.bounce(collision.normal)
