class_name ThingFactory


static func make(transform2d: Transform2D = Transform2D()) -> Thing:
	var new_thing := preload("res://Junk/Thing.tscn").instance()
	new_thing.get_node("sprite").transform = transform2d
	return new_thing as Thing
