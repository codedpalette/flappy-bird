extends Node2D

# TODO: Make this a pool to space out the pipes
var pipe_pair: PipePair = preload("res://scenes/obstacles/pipe_pair.tscn").instantiate()
@export_range(0.0, 100.0, 1.0) var gap = 50.0:
    set(value):
        gap = value
        pipe_pair.gap = value

func _ready():
    pipe_pair.position = Vector2(0, 250) # FIXME: Random vertical position
    add_child(pipe_pair)