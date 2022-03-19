extends RayCast
class_name RayCastReporter

signal raycast_collide(body)
var _was_colliding := false

func _physics_process(_delta) -> void:
  if is_colliding():
    if not _was_colliding:
      emit_signal("raycast_collide", get_collider())
  _was_colliding = is_colliding()
