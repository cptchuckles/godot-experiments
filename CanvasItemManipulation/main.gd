extends Node2D


export(NodePath) var CANVAS_ITEM_NODE: NodePath
onready var item: CanvasItem = get_node(CANVAS_ITEM_NODE) as CanvasItem

onready var rid = item.get_canvas_item()
onready var crid = item.get_world_2d().get_canvas()
onready var vp = get_viewport().get_viewport_rid()

func _ready() -> void:
	assert(is_instance_valid(item), "You must select a CanvasItem node")
	prints(rid.get_id(), crid.get_id())
	VisualServer.canvas_item_add_set_transform(rid, item.global_transform.translated(Vector2.RIGHT * 120))
	VisualServer.canvas_item_add_circle(rid, item.global_position, 200, Color.white)
