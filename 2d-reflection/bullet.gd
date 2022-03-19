extends KinematicBody2D

export(NodePath) var TARGET_NODE
onready var TARGET = get_node(TARGET_NODE)

export(float) var SPEED = 64.0  # pixels per second

var velocity := Vector2.RIGHT

func _ready() -> void:
  look_at(TARGET.global_position)
  velocity = global_transform.x


func _physics_process(delta) -> void:
  var info = move_and_collide(velocity * SPEED * delta)
  if info and info.collider is StaticBodyReflector:
    velocity = velocity.bounce(info.normal)
    print("potato bread")
    $AudioStreamPlayer.play()
    DebugDraw.set_text("POTATO","BREAD")
