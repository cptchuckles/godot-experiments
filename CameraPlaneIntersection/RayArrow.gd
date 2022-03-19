extends MeshInstance

func _on_RayCastReporter_raycast_collide(body: CollisionObject) -> void:
  print(name + " hit body " + str(body))
