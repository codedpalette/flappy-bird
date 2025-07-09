extends Node2D

class_name PipePair

const SPEED = 100
@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var pipe_top: StaticBody2D = $PipeTop
@onready var pipe_bottom: StaticBody2D = $PipeBottom

var gap = 50.0:
	set(value):
		gap = value
		if is_node_ready(): update_gap()


func update_gap():
	pipe_top.position.y = - gap / 2
	pipe_bottom.position.y = gap / 2

func _ready():
	update_gap()

func _physics_process(delta):
	position.x -= SPEED * delta
