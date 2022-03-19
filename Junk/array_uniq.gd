extends Node

export(Array, int) var things: Array = [3,67,3,54,7,3,3,4,67,8,6,65,4,5,6,87,7,7,5,4,3,3,45,6,76]
export(Array, Dictionary) var other_things

func _ready():
	things.sort()

	var n: int = 0
	while true:
		n += 1
		if n >= things.size(): break
		if things[n] == things[n-1]:
			things.remove(n)
			n -= 1

	print(var2str(things))
