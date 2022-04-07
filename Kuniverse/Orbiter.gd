extends Spatial


export(float) var ECCENTRICITY := 1.0
export(float) var ORBIT_SPEED  := 1.0  # orbits per minute

onready var orbit_spinner := $OrbitSpinner as Spatial


func _ready() -> void:
	scale.x = ECCENTRICITY
	ORBIT_SPEED /= 60.0


func _process(delta:float) -> void:
	orbit_spinner.rotate_y(2*PI*ORBIT_SPEED * delta)
