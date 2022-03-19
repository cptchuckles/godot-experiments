extends YSort

func _ready() -> void:
  print_things()

func print_things() -> void:
  return
  print("===========")
  for child in get_children():
    print(child.name + ": " + str(child.z_index))
