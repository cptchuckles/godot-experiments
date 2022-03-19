extends Node2D

func subseq(sub: Array, sup: Array) -> bool:
	if sub.size() == 0 || sub.size() > sup.size(): return false
	var i: int = 0
	for n in sup:
		if sub[i] == n:
			i += 1
			if i==sub.size(): return true
		else:
			i = 0
	return false

func _ready() -> void:
	var sub := [4,2,0]
	var sup1 := [1,6,3,4,2,9,0]
	var sup2 := [7,4,2,0,9,3]
	
	print(subseq(sub, sup1))
	print(subseq(sub, sup2))
	print(subseq("fuck".to_wchar(), "motherfucker".to_wchar()))

	get_tree().quit()
