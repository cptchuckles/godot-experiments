tool
extends Node

var my_boring_var: String
var display_var_name := "my_fantastic%_var"

func _get_property_list() -> Array:
	var properties := Array()
	properties.append({
		name = display_var_name,
		type = TYPE_STRING,
		usage = PROPERTY_USAGE_DEFAULT
	})
	return properties


func _set(property: String, value) -> bool:
	match property:
		display_var_name:
			my_boring_var = value
			return true
		_ :
			return false


func _get(property: String):
	match property:
		display_var_name:
			return my_boring_var
		_ :
			return null
