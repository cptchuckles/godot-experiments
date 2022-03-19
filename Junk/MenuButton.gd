extends MenuButton

enum Menu {
	OPTION_A = 1,
	OPTION_B = 2,
	QUIT = 5,
}


onready var menu := get_popup()


func _ready() -> void:
	menu.connect("id_pressed", self, "_on_menu_id_pressed")


func _on_menu_id_pressed(id: int) -> void:
	var idx = menu.get_item_index(id)
	match id:
		Menu.OPTION_A:
			menu.set_item_checked(idx, true)
			menu.set_item_checked(menu.get_item_index(Menu.OPTION_B), false)
		Menu.OPTION_B:
			menu.set_item_checked(idx, true)
			menu.set_item_checked(menu.get_item_index(Menu.OPTION_A), false)
		Menu.QUIT:
			get_tree().quit()
