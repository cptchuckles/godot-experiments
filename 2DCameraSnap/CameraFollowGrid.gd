extends Node2D

export(float) var SNAPFACTOR = 0.2	# how fast camera lerps to desired position

# Allows me to set the target node in the inspector.	I selected the player
export(NodePath) var TARGET_NODE_PATH
onready var TARGET : Node2D = get_node(TARGET_NODE_PATH)

# Get the width and height of the pretend viewport/camera thing
onready var view_width : float = $ColorRect.rect_size.x
onready var view_height : float = $ColorRect.rect_size.y


# Actual relevant code
func _process(_delta: float) -> void:
	var goal_x := TARGET.global_position.x - fmod(TARGET.global_position.x, view_width)
	var goal_y := TARGET.global_position.y - fmod(TARGET.global_position.y, view_height)
	var goal_pos := Vector2(goal_x,goal_y)
	global_position = lerp(global_position, goal_pos, SNAPFACTOR)
