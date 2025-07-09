extends Node2D

# TODO: Make this a pool to space out the pipes
var pipe_pair: PipePair = preload("res://systems/obstacles/pipe_pair.tscn").instantiate()
@export_range(0.0, 100.0, 1.0) var gap = 50.0:
	set(value):
		gap = value
		pipe_pair.gap = value

func _ready():
	pipe_pair.position = Vector2(0, _get_random_vertical_position())
	add_child(pipe_pair)
	pipe_pair.visible_notifier.connect("screen_exited", _pipe_exited)


func _pipe_exited():
	pipe_pair.position = Vector2(0, _get_random_vertical_position())


func _get_random_vertical_position():
	return randf_range(100, 300) # TODO: Calculate range based on tube sprite height and gap
