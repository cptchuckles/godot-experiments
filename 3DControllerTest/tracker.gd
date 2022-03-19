extends KinematicBody

onready var player = $"../Player"

var speed: int = 10
var vec_to_player: Vector3

func _ready():
	if player == null:
		return
		
	vec_to_player = player.translation - translation

func _physics_process(delta):
	var c = move_and_collide(vec_to_player.normalized() * speed * delta)
	if c:
		if c.collider.name == "Player":
			print("damage")
		if not c.collider.is_in_group("enemies"):
			queue_free()
