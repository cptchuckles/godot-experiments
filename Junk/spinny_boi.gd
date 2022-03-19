extends Sprite


func _process(delta: float) -> void:
	rotation = fposmod(rotation + PI * delta, TAU)
