extends Node2D


onready var guy: Sprite = $guy as Sprite
onready var arc_label: Label = $arc_label as Label
onready var scale_label: Label = $scale_label as Label


func _process(_delta: float) -> void:
	update()


func _draw() -> void:
	draw_sprite_outline_and_aabb()

	arc_label.visible = guy.drag
	scale_label.visible = guy.drag
	if guy.drag: draw_arcs_and_levers()


func draw_sprite_outline_and_aabb() -> void:
	var w: float = guy.texture.get_width()  / 2
	var h: float = guy.texture.get_height() / 2

	# Sprite corners
	var tl: Vector2 = guy.transform.xform(Vector2(-w, -h))
	var tr: Vector2 = guy.transform.xform(Vector2(+w, -h))
	var bl: Vector2 = guy.transform.xform(Vector2(-w, +h))
	var br: Vector2 = guy.transform.xform(Vector2(+w, +h))

	draw_line(tl, tr, Color.yellow)
	draw_line(tl, bl, Color.yellow)
	draw_line(tr, br, Color.yellow)
	draw_line(bl, br, Color.yellow)

	# Sprite AABB
	var l: float = min(min(tl.x, tr.x), min(bl.x, br.x))
	var t: float = min(min(tl.y, tr.y), min(bl.y, br.y))
	var r: float = max(max(tl.x, tr.x), max(bl.x, br.x))
	var b: float = max(max(tl.y, tr.y), max(bl.y, br.y))

	draw_rect(Rect2(l, t, r-l, b-t), Color.white, false)


func draw_arcs_and_levers() -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	draw_line(guy.position, guy.position + guy.lever, Color.orange, 2)
	draw_line(guy.position, mouse_pos, Color.red, 2)

	var arc_start: float = guy.lever.angle()
	var arc_delta: float = guy.lever.angle_to(mouse_pos - guy.position)
	draw_arc(
			guy.position,
			guy.lever.length(),
			arc_start,
			arc_start + arc_delta,
			32,
			Color.blue, 2)
	arc_label.text = "rot_delta: %.02f" % rad2deg(arc_delta)
	arc_label.rect_position = guy.position + guy.lever.normalized().slerp((mouse_pos - guy.position).normalized(), 0.5) * guy.lever.length()
	arc_label.rect_position.x = clamp(arc_label.rect_position.x, 0, get_viewport().size.x - arc_label.rect_size.x)
	arc_label.rect_position.y = clamp(arc_label.rect_position.y, 0, get_viewport().size.y - arc_label.rect_size.y)

	draw_arc(
			guy.position,
			guy.position.distance_to(mouse_pos),
			arc_start,
			arc_start - (2*PI - abs(arc_delta))*sign(arc_delta),
			64,
			Color.burlywood)

	var scale_delta: float = guy.position.distance_to(mouse_pos) / guy.lever.length()
	scale_label.text = "scale_delta: %.02f" % scale_delta
	scale_label.rect_position = mouse_pos + Vector2(10, -10)
	scale_label.rect_position.x = clamp(scale_label.rect_position.x, 0, get_viewport().size.x - scale_label.rect_size.x)
	scale_label.rect_position.y = clamp(scale_label.rect_position.y, 0, get_viewport().size.y - scale_label.rect_size.y)
