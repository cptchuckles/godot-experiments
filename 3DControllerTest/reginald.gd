extends RigidBody


const fuck: float = 20.0


func _physics_process(_delta: float) -> void:
	add_central_force(Vector3.RIGHT * fuck)
