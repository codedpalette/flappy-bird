extends Node2D

var pipe_pair: PipePair = preload("res://systems/obstacles/pipe_pair.tscn").instantiate()
@export_range(0.0, 100.0, 1.0) var gap = 50.0:
	set(value):
		gap = value
		if pipe_pair.is_node_ready(): pipe_pair.gap = value

func _ready():
	add_child(pipe_pair)
	pipe_pair.position = Vector2(0, _get_random_vertical_position())
	pipe_pair.gap = gap
	pipe_pair.visible_notifier.connect("screen_exited", _pipe_exited)

func _pipe_exited():
	pipe_pair.position = Vector2(0, _get_random_vertical_position())

func _get_random_vertical_position():
	return randf_range(100, 300)
